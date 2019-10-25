resource "aws_lambda_event_source_mapping" "event_source_mapping" {
  batch_size        = 1
  event_source_arn  = "${aws_sqs_queue.sqs-source-queue.arn}"
  enabled           = true
  function_name     = "${aws_lambda_function.lambda-sqs-trigger-sns.arn}"
}
