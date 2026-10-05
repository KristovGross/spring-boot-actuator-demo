# ============================================================
# ECS CLUSTER
# ============================================================
resource "aws_ecs_cluster" "main" {
  name = "${var.project_name}-${var.environment}-cluster"

  tags = {
    Name        = "${var.project_name}-${var.environment}-cluster"
    Environment = var.environment
    Project     = var.project_name
  }
}

# ============================================================
# IAM - ECS TASK EXECUTION ROLE
# ============================================================
data "aws_iam_policy_document" "ecs_task_execution_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = [
        "ecs-tasks.amazonaws.com"
      ]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role" "ecs_task_execution" {
  name = "${var.project_name}-${var.environment}-ecs-execution-role"

  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution_assume_role.json

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution" {
  role = aws_iam_role.ecs_task_execution.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# ============================================================
# SECURITY GROUP ECS
# ============================================================
resource "aws_security_group" "ecs" {
  name        = "${var.project_name}-${var.environment}-ecs-sg"
  description = "Permite trafico desde el ALB hacia ECS"
  vpc_id      = var.vpc_id

  ingress {
    description = "Trafico desde el Application Load Balancer"

    from_port = var.container_port
    to_port   = var.container_port
    protocol  = "tcp"

    security_groups = [
      var.alb_security_group_id
    ]
  }

  egress {
    description = "Permitir trafico saliente"

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-ecs-sg"
    Environment = var.environment
    Project     = var.project_name
  }
}

# ============================================================
# ECS TASK DEFINITION
# ============================================================
resource "aws_ecs_task_definition" "app" {
  family = "${var.project_name}-${var.environment}"

  requires_compatibilities = [
    "FARGATE"
  ]

  network_mode = "awsvpc"

  cpu    = var.task_cpu
  memory = var.task_memory

  execution_role_arn = aws_iam_role.ecs_task_execution.arn

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = jsonencode([
    {
      name = var.container_name

      image = "${var.ecr_repository_url}:${var.image_tag}"

      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]

      environment = [
        {
          name  = "SPRING_PROFILES_ACTIVE"
          value = var.environment
        },
        {
          name  = "MANAGEMENT_ENDPOINT_SHUTDOWN_ENABLED"
          value = "false"
        },
        {
          name  = "MANAGEMENT_HEALTH_SHOW_DETAILS"
          value = var.environment == "dev" ? "always" : "never"
        },
        {
          name  = "MANAGEMENT_ENDPOINTS_WEB_EXPOSURE_INCLUDE"
          value = "health,info,prometheus"
        },
        {
          name  = "LOGGING_LEVEL_ROOT"
          value = var.environment == "prod" ? "WARN" : "INFO"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"

        options = {
          awslogs-group         = var.cloudwatch_log_group_name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# ============================================================
# ECS SERVICE
# ============================================================
resource "aws_ecs_service" "app" {
  name    = "${var.project_name}-${var.environment}-service"
  cluster = aws_ecs_cluster.main.id

  task_definition = aws_ecs_task_definition.app.arn

  desired_count = var.desired_count

  launch_type = "FARGATE"

  health_check_grace_period_seconds = 60

  network_configuration {
    subnets = var.subnet_ids

    security_groups = [
      aws_security_group.ecs.id
    ]

    assign_public_ip = var.assign_public_ip
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-service"
    Environment = var.environment
    Project     = var.project_name
  }
}