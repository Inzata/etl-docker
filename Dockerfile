FROM centos:7
MAINTAINER Ales Cervenka <ales.cervenka@inzata.com>

RUN yum install -y yum-plugin-ovl

# Inzata ETL

RUN yum install -y https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-3.noarch.rpm

RUN yum install -y epel-release && yum clean all

RUN yum install -y yum-utils wget perl-HTTP-DAV && \
	wget https://etl.inzata.com/repos/el7/inzataetl-5.x.repo -O/etc/yum.repos.d/inzataetl-5.x.repo && \
	yum install -y inzata-etlp && \
	yum clean all && \
	rm -rf /var/cache/yum	

# we needed the perl-HTTP-DAV just because of dependencies...

RUN yum remove -y perl-HTTP-DAV

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh && \
	chmod 700 /etc/bootstrap.sh

VOLUME /var/etl

ENTRYPOINT ["/etc/bootstrap.sh"]

CMD ["-d"]

EXPOSE 80

