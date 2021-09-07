#in this template we are creating aws application laadbalancer and target group and alb http listener

resource "aws_alb" "alb" {
  name            = "nimbleapp-load-balancer"
  subnets         = aws_subnet.public.*.id
  security_groups = [aws_security_group.alb-sg.id]
}

resource "aws_alb_target_group" "nimbleapp-tg" {
  name        = "nimbleapp-tg"
  port        = var.app_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.nimble-vpc.id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    protocol            = "HTTP"
    matcher             = "200"
    path                = var.health_check_path
    interval            = 30
  }
}

#redirecting all incomming traffic from ALB to the target group
resource "aws_alb_listener" "nimbleapp" {
  load_balancer_arn = aws_alb.alb.id
  port              = var.access_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.nimbleapp-tg.arn
  }
}
