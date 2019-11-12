RUN pip3 install py4j 
# JAVA and PYTHON
RUN apt-get update && apt-get install --no-install-recommends -y \
  openjdk-8-jre \
  gcc git openssh-client less curl \
  libxtst-dev libxext-dev libxrender-dev libfreetype6-dev \
  libfontconfig1 libgtk2.0-0 libxslt1.1 libxxf86vm1 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && useradd -ms /bin/bash developer

WORKDIR /opt/pycharm

ARG pycharm_source=https://download.jetbrains.com/python/pycharm-community-192.6603.24.tar.gz

RUN curl -fsSL $pycharm_source -o /opt/pycharm/installer.tgz \
  && tar --strip-components=1 -xzf installer.tgz \
  && rm installer.tgz \
  && /usr/bin/python3 /opt/pycharm/helpers/pydev/setup_cython.py build_ext --inplace


USER developer
