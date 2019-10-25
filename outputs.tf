output "sqs_url" {
  value = "${aws_sqs_queue.sqs-source-queue.id}"
}
