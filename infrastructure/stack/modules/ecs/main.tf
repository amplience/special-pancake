
resource "aws_ecs_cluster" "main" {
  name = "${var.name}-ecs-cluster"
}

resource "aws_ecs_service" "main" {
 name                               = "${var.name}-ecs-service"
 cluster                            = aws_ecs_cluster.main.id
 task_definition                    = aws_ecs_task_definition.main.arn
 desired_count                      = 1
 #deployment_minimum_healthy_percent = 50
 #deployment_maximum_percent         = 200
 launch_type                        = "FARGATE"
 #scheduling_strategy                = "REPLICA"

 network_configuration {
   security_groups  = [aws_security_group.ecs_tasks.id]
   subnets = var.subnets
   assign_public_ip = true
 }

 load_balancer {
   target_group_arn = var.alb_target_group_arn
   container_name   = "${var.name}-container"
   container_port   = var.container_port
 }

 lifecycle {
   ignore_changes = [task_definition, desired_count]
 }
}

resource "aws_ecs_task_definition" "main" {
  family = var.name
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  cpu                      = 256
  memory                   = 512
  network_mode             = "awsvpc"

  container_definitions = jsonencode([{
    name        = "${var.name}-container"
    image       = "${var.container_image}"
    essential   = true # must have one essential container in task
    portMappings = [{
      protocol      = "tcp"
      containerPort = var.container_port
      #hostPort      = var.container_port # must be same as container port for awsvc network mode
    }]
  }])
}
