FROM public.ecr.aws/lambda/python:3.8-x86_64

# TODO: Update this version from 4.1.2 to 4.1.3 for local run
ENV R_VERSION=4.1.3

RUN yum -y install wget binutils yum-utils tar
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum-config-manager --enable epel
RUN yum -y install libxml2-devel libjpeg-turbo-devel libpng-devel openssl-devel

# Devtools requires libgit2 but is not found in awslinux so we need to hardcode this dependency
RUN wget https://rpmfind.net/linux/centos/7.9.2009/extras/x86_64/Packages/libgit2-0.26.6-1.el7.x86_64.rpm \
  && yum -y install libgit2-0.26.6-1.el7.x86_64.rpm \
  && rm libgit2-0.26.6-1.el7.x86_64.rpm

# Devtools requires libgit2 but is not found in awslinux so we need to hardcode this dependency
RUN wget https://rpmfind.net/linux/centos/7.9.2009/extras/x86_64/Packages/libgit2-devel-0.26.6-1.el7.x86_64.rpm \
  && yum -y install libgit2-devel-0.26.6-1.el7.x86_64.rpm \
  && rm libgit2-devel-0.26.6-1.el7.x86_64.rpm

# Download and Install R
RUN wget -q https://cdn.rstudio.com/r/centos-7/pkgs/R-${R_VERSION}-1-1.x86_64.rpm \
  && yum -y install R-${R_VERSION}-1-1.x86_64.rpm \
  && rm R-${R_VERSION}-1-1.x86_64.rpm


ENV PATH="${PATH}:/opt/R/${R_VERSION}/bin"

# # Install R Packages
RUN Rscript -e "install.packages(c('versions'), repos = 'https://cloud.r-project.org/')"
COPY install_dependencies.R /tmp/
RUN Rscript /tmp/install_dependencies.R

# # Command can be overwritten by providing a different command in the template directly.
CMD ["R --version"]

