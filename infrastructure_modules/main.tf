# storing slack api in ssm, best practices and similar to setup in infra repo
data "aws_ssm_parameter" "slack_webhook" {
  name = "/ai-insights/slack-webhook-url"
}

# defining my cron job scheduling through eventbridge
resource "aws_cloudwatch_event_rule" "weekly_trigger" {
  name                = var.event_name
  schedule_expression = var.cron
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.weekly_trigger.name
  target_id = "triggerLambda" # maybe not needed? kept for clarity
  arn       = aws_lambda_function.serverless_kpi_agent.arn
}

# allowing eventbridge (previously part of cloudwatch events) to invoke my lambda
resource "aws_lambda_permission" "allow_events" {
  statement_id = var.statement_id
  action = var.event_action
  function_name = aws_lambda_function.serverless_kpi_agent.function_name
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.weekly_trigger.arn
}

resource "aws_lambda_function" "serverless_kpi_agent" {
  function_name = var.lambda_name
  role = aws_iam_role.lambda_execution_role.arn
  runtime = var.application_language
  # handler =
  # filename = "${path.module}/../lambda/lambda_package.zip" 
  timeout = var.timeout

  # TODO: there may be a better way to call ssm api for slack_webhook
  environment {
    variables = {
      SLACK_WEBHOOK = data.aws_ssm_parameter.slack_webhook.value
    }
  }
}