#############################################################
# Dockerfile to build container for Synapse Python client
#############################################################

# Base Image
FROM ubuntu:16.04

# Metadata
LABEL base.image="ubuntu:16.04"
LABEL version="1"
LABEL software="synapseclient"
LABEL software.version="1.6.1"
LABEL description="Programmatic interface to Synapse services for Python"
LABEL website="https://github.com/Sage-Bionetworks/synapsePythonClient"
LABEL documentation="https://github.com/Sage-Bionetworks/synapsePythonClient"
LABEL license="https://github.com/Sage-Bionetworks/synapsePythonClient"
LABEL tags="General"

# File Author / Maintainer
MAINTAINER James Eddy <james.a.eddy@gmail.com>

# set version here to minimize need for edits below
ENV VERSION=1.6.1

# set up packages
USER root

ENV PACKAGES python-dev git python-setuptools python-pip

RUN apt-get update && \
    apt-get install -y --no-install-recommends ${PACKAGES}

RUN git clone git://github.com/Sage-Bionetworks/synapsePythonClient.git && \
    cd synapsePythonClient && \
    git checkout v${VERSION} && \
    python setup.py install

COPY bin/synapse_get /usr/local/bin/
RUN chmod a+x /usr/local/bin/synapse_get

CMD ["/bin/bash"]
