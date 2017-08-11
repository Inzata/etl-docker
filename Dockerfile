FROM centos:6.7
MAINTAINER Ales Cervenka <ales.cervenka@inzata.com>

RUN yum install -y yum-plugin-ovl

# Inzata ETL

RUN yum install -y yum-utils wget && \
	wget https://repo.inzata.com/etl/el6/inzataetl-5.x.repo -O/etc/yum.repos.d/inzataetl-5.x.repo && \
	yum clean all && \
	yum install -y inzata-etlp

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh && \
	chmod 700 /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh", "-d"]

EXPOSE 80

