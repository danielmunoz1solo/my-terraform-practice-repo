# Provider
variable "region" {
  description = "aws region where the lambda function will be deployed"
  type = string
}

# Lambda
variable "lambda_name" {
  description = "name of the lamda function"
  type = string
}
variable "application_language" {
  description = "the application server type that will be used to run your code, eg python, node, java, ruby, amazon linux 2023"
  type = string
}
variable "timeout" {
  description = "max amount in seconds for lambda runtime"
  type = number
}
variable "event_name" {
  description = "name of the cloudawtch event triggered weekly... possibly more often"
  type = string
}
variable "cron" {
  description = "cron datetime to trigger cloudwatch event"
  type = string
}
variable "event_action" {
  description = "action to be taking by eventbridge, ie InvokeLambda"
  type = string
}
variable "statement_id" {
  description = "identifier for statement used by eventbridge"
}