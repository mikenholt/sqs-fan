resource "aws_sqs_queue" "sqs-source-queue" {
  name = "SourceQueue"
}

resource "aws_sqs_queue" "sqs-target-queue1" {
  name = "TargetQueue1"
}

resource "aws_sqs_queue_policy" "p1" {
  queue_url = "${aws_sqs_queue.sqs-target-queue1.id}"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.sqs-target-queue1.arn}"
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "sqs-target-queue2" {
  name = "TargetQueue2"
}

resource "aws_sqs_queue_policy" "p2" {
  queue_url = "${aws_sqs_queue.sqs-target-queue2.id}"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.sqs-target-queue2.arn}"
    }
  ]
}
POLICY
}
