FROM centos
MAINTAINER phil@redhat.com

# .NET Core RPM packages not currently available so:
RUN yum -y install libicu libuuid libcurl openssl libunwind wget

RUN mkdir -p /root/bin/dotnet
RUN wget https://dotnetcli.blob.core.windows.net/dotnet/dev/Binaries/Latest/dotnet-centos-x64.latest.tar.gz
RUN tar xf dotnet-centos-x64.latest.tar.gz -C /root/bin/dotnet

ENV PATH $PATH:/root/bin/dotnet/bin
ENV DOTNET_HOME /root/bin/dotnet
