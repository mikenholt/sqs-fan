data "archive_file" "lambda-sqs-trigger-sns" {
  type        = "zip"
  source_file = "${path.module}/lambda-sqs-trigger-sns.py"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function" "lambda-sqs-trigger-sns" {
  function_name = "lambda-sqs-trigger-sns"
  handler = "lambda-sqs-trigger-sns.handler"
  role = "${data.aws_iam_role.lambda-sqs-trigger-sns.arn}"
  runtime = "python3.6"

  filename = "${data.archive_file.lambda-sqs-trigger-sns.output_path}"
  source_code_hash = "${data.archive_file.lambda-sqs-trigger-sns.output_base64sha256}"

  timeout = 30
  memory_size = 128

  environment {
    variables = {
      SNS_ARN = "${aws_sns_topic.sqs_msg_fan-topic.arn}"
    }
  }
}
