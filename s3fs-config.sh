#!/bin/bash

echo $AWSACCESSID:$AWSSECRETID > ~/.passwd-s3fs
cat ~/.passwd-s3fs
s3fs $BUCKET /leofsfolder -o url=$URL
tail -f ~/.passwd-s3fs
