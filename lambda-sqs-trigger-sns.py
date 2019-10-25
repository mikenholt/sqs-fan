import boto3
import json
import os

def handler(event, context):
    print("sending msg to sns")

    sns = boto3.client('sns')
    sns.publish(
    	TargetArn=os.environ['SNS_ARN'],
    	Message=json.dumps(event['Records'][0]['body'])
    )

    print("complete")