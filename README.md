# Kumite :martial_arts_uniform:

Environment to run [Karate](https://intuit.github.io/karate/) features stored in [AWS S3 buckets](https://aws.amazon.com/s3/).

# Unique requirement :whale2:
- Docker should be installed on your machine

# Run your tests :gear:

```bash
docker build . -t kumite
```

```bash
docker run --rm kumite {{fullS3PathOfYourFeatures}}
```

# Check the reports :bar_chart:
The execution should generate a Cucumber HTML report that could be open with your favourite browser at `target/cucumber-html-reports/overview-features.html`

# Any feedback? :memo:
Send me anything but viruses to marta.arcones@gmail.com :woman_technologist:

#TODO
- Add examples to docker run command
- Credential management when the bucket is not public