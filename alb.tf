resource "aws_lb" "alb" {
  name               = local.lb["name"]
  internal           = local.lb["internal"]
  load_balancer_type = "application"
  subnets            = aws_subnet.public.*.id
  security_groups    = [aws_security_group.alb-sg.id]
}

resource "aws_lb_target_group" "group" {
  name        = local.lb.target_group["name"]
  port        = local.lb.target_group["port"]
  protocol    = local.lb.target_group["protocol"]
  vpc_id      = aws_vpc.nimble-vpc.id
  target_type = "ip"

  depends_on = [aws_lb.alb]
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.group.arn
  }
}
