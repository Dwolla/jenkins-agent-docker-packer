PYTHON_TAG := $(PYTHON_JDK11_TAG)
JOB := PYTHON-${PYTHON_TAG}
CLEAN_JOB := clean-${PYTHON_TAG}

all: ${JOB}
clean: ${CLEAN_JOB}
.PHONY: all clean ${JOB} ${CLEAN_JOB}

${JOB}: PYTHON-%: Dockerfile
	docker buildx build \
	  --platform linux/arm64,linux/amd64 \
	  --build-arg PYTHON_TAG=$* \
	  --tag dwolla/jenkins-agent-sbt:$*-SNAPSHOT \
	  .

${CLEAN_JOB}: clean-%:
	docker image rm --force dwolla/jenkins-agent-sbt:$*-SNAPSHOT
