# Jenkins Agent with Packer

[![](https://images.microbadger.com/badges/image/dwolla/jenkins-agent-sbt.svg)](https://microbadger.com/images/dwolla/jenkins-agent-sbt)
[![license](https://img.shields.io/github/license/dwolla/jenkins-agent-docker-sbt.svg?style=flat-square)](https://github.com/Dwolla/jenkins-agent-docker-packer/blob/master/LICENSE)

Docker image based on Dwolla’s [python Jenkins Agent](https://github.com/Dwolla/jenkins-agent-docker-core) images, making [packer](http://scala-sbt.org) available to Jenkins jobs.

GitHub Actions will build the Docker images for multiple supported architectures.

## Local Development

```bash
make \
    PYTHON_JDK11_TAG=$(curl -L -s 'https://registry.hub.docker.com/v2/repositories/dwolla/jenkins-agent-python/tags?page_size=1024'| jq '.results[1].name') \
    all
```

Alternatively, fetch the most recent python tag value defined [here](https://hub.docker.com/r/dwolla/jenkins-agent-python/tags) and run the following command:

`make PYTHON_JDK11_TAG=<latest-python-tag> all`