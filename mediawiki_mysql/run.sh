#!/bin/bash
scl enable httpd24 bash
systemctl start httpd24-httpd
httpd -h
while true; do sleep 1; done
