resource "aws_ecs_cluster" "nimble-cluster" {
  name = "nimbleapp-cluster"
}

data "template_file" "nimbleapp" {
  template = file("./templates/image/image.json")

  vars = {
    app_image      = var.app_image
    app_port       = var.app_port
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region     = var.aws_region    
  }
}

resource "aws_ecs_task_definition" "nimble-def" {
  family                   = "nimbleapp-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = data.template_file.nimbleapp.rendered
}

resource "aws_ecs_service" "nimble-service" {
  name            = "nimbleapp-service"
  cluster         = aws_ecs_cluster.nimble-cluster.id
  task_definition = aws_ecs_task_definition.nimble-def.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_sg.id]
    subnets          = aws_subnet.private.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.nimbleapp-tg.arn
    container_name   = "nimbleapp"
    container_port   = var.app_port
  }

  depends_on = [aws_alb_listener.nimbleapp, aws_iam_role_policy_attachment.ecs_task_execution_role]
}
