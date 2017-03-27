#############################################################
# Dockerfile to build container for Synapse Python client
#############################################################

# Base Image
FROM ubuntu:16.04

# Metadata
LABEL base.image="biocontainers:latest"
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

ENV version=1.6.1

# Setup packages
USER root

#zlib1g-dev libbz2-dev gcc g++ make ca-certificates
ENV PACKAGES python-dev git python-setuptools python-pip

RUN apt-get update && \
    apt-get install -y --no-install-recommends ${PACKAGES} && \
    apt-get clean

RUN git clone git://github.com/Sage-Bionetworks/synapsePythonClient.git && \
    cd synapsePythonClient && \
    git checkout v${version} && \
    python setup.py install

# copy over the script
#COPY bin/my_md5sum /bin/
#RUN chmod a+x /bin/my_md5sum

# by default /bin/bash is executed
CMD ["/bin/bash"]
