FROM centos
MAINTAINER phil@redhat.com

# .NET Core RPM packages not currently available so:
RUN yum -y install libicu libuuid libcurl openssl libunwind wget

RUN useradd -d /home/dotnet -m dotnet
RUN mkdir -p /home/dotnet/bin/dotnet
RUN wget https://dotnetcli.blob.core.windows.net/dotnet/dev/Binaries/Latest/dotnet-centos-x64.latest.tar.gz
RUN tar xf dotnet-centos-x64.latest.tar.gz -C /home/dotnet/bin/dotnet

ENV PATH $PATH:/home/dotnet/bin/dotnet/bin
ENV DOTNET_HOME /home/dotnet/bin/dotnet

WORKDIR /home/dotnet
RUN dotnet --version
