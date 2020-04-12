FROM debian:buster-slim

# installing requirements
RUN apt-get update && apt-get install -y \
  xz-utils \
  curl \
  && rm -rf /var/lib/apt/lists/*

#Getting prebuilt binary from llvm 
RUN  curl -SL https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz \
  | tar -xJC . && \
  mv clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04 clang_10 && \
  echo 'export PATH=/clang_10/bin:$PATH' >> ~/.bashrc && \
  echo 'export LD_LIBRARY_PATH=/clang_10/lib:$LD_LIBRARY_PATH' >> ~/.bashrc

#debian buster dependency,incase you use ubuntu as base image then no need this part
RUN apt-get update && apt-get install -y libncurses5
# Start from a Bash prompt
CMD [ "/bin/bash" ]
