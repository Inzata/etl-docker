FROM centos:7
MAINTAINER Ales Cervenka <ales.cervenka@inzata.com>

RUN yum install -y yum-plugin-ovl

# Inzata ETL

RUN yum install -y epel-release && yum clean all

RUN yum install -y yum-utils wget && \
	wget https://repo.inzata.com/etl/el7/inzataetl-5.x.repo -O/etc/yum.repos.d/inzataetl-5.x.repo && \
	yum clean all && \
	yum install -y inzata-etlp

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh && \
	chmod 700 /etc/bootstrap.sh

VOLUME /var/etl

ENTRYPOINT ["/etc/bootstrap.sh"]

CMD ["-d"]

EXPOSE 80

