FROM ubuntu

COPY runner.sh .

RUN apt-get update  \
	&& apt-get install cmake -y
CMD ["/bin/bash"]
