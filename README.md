# Kumite :martial_arts_uniform:

Environment to run [Karate](https://intuit.github.io/karate/) features stored in [AWS S3 buckets](https://aws.amazon.com/s3/).
It will download the features from your S3 to run them inside a docker container. When it finishes, the reports will be uploaded to your S3.

# Requirement :whale2:
- Docker should be installed on your machine

# Run your tests :gear:

```bash
docker build . -t kumite
```

```bash
docker run -e AWS_ACCESS_KEY_ID='{{ yourAccessKeyID }}' -e AWS_SECRET_ACCESS_KEY='{{ yourSecretAccessKey }}' -e BUCKET_NAME='{{ yourBucketName }}' --rm kumite
```

# Path convention :bar_chart:
- You should leave the features inside a folder named ```features``` in the bucket
- The execution will upload to a folder named ```target``` the cucumber reports generated

# Any feedback? :memo:
Send me anything but viruses to marta.arcones@gmail.com :woman_technologist: