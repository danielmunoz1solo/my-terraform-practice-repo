data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "lambda_logs" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "iam-role-${var.lambda_name}"

  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "lambda_logs" {
  name        = "lambda-logs-policy-${var.lambda_name}"
  description = "Allow Lambda to write logs to CloudWatch"
  policy      = data.aws_iam_policy_document.lambda_logs.json
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role = aws_iam_role.lambda_execution_role
  policy_arn = aws_iam_policy.lambda_logs.arn
}

resource "aws_iam_policy" "ssm_access" {
  name        = "ssm-read-policy-${var.lambda_name}"
  description = "Allow Lambda to read from SSM Parameter Store"
  policy      = data.aws_iam_policy_document.ssm_access.json
}

resource "aws_iam_role_policy_attachment" "ssm_access" {
  role = aws_iam_role.lambda_execution_role
  policy_arn = aws_iam_policy.ssm_access.arn
}
#! any other policies needed? maybe s3 for some storage facility
