#!/bin/bash

aws ec2 run-instances \
--image-id ami-01bc990364452ab3e \
--count 1 \
--instance-type t3.micro \
--key-name my-key \
--security-groups my-ssh-sg \