FROM centos
MAINTAINER phil@redhat.com

# install packages required to install
RUN yum -y install unzip automake libtool wget

# install .NET Version Manager (DNVM) to install different versions of the .NET Execution Environment (DNX) on Linux
RUN curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh

# install .NET Execution Environment (DNX) is used to build and run .NET projects - only Mono currently supported
RUN dnvm upgrade -r mono

# install Libuv - multi-platform asynchronous IO library that is used by Kestrel, 
# a cross-platform HTTP server for hosting ASP.NET 5 web applications.
RUN wget http://dist.libuv.org/dist/v1.8.0/libuv-v1.8.0.tar.gz
RUN tar -zxf libuv-v1.8.0.tar.gz
RUN cd libuv-v1.8.0 && sh autogen.sh && ./configure && make && make check && make install
RUN ln -s /usr/lib64/libdl.so.2 /usr/lib64/libdl && ln -s /usr/local/lib/libuv.so.1.0.0 /usr/lib64/libuv.so
