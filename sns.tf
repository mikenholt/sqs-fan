resource "aws_sns_topic" "sqs_msg_fan-topic" {
  name = "sqs_msg_fan-topic"
}

resource "aws_sns_topic_subscription" "target1" {
  topic_arn = "${aws_sns_topic.sqs_msg_fan-topic.arn}"
  endpoint  = "${aws_sqs_queue.sqs-target-queue1.arn}"
  protocol  = "sqs"
}

resource "aws_sns_topic_subscription" "target2" {
  topic_arn = "${aws_sns_topic.sqs_msg_fan-topic.arn}"
  endpoint  = "${aws_sqs_queue.sqs-target-queue2.arn}"
  protocol  = "sqs"
}