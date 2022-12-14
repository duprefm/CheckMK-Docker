FROM centos:7
LABEL name="check_mk_agent"
COPY files /files
RUN set -e \
        && /usr/bin/yum -y install epel-release \
        && /usr/bin/yum -y install xinetd \
	&& chmod 740 /files/check-mk-agent-2.1.0p10-1.noarch.rpm \
	&& yum localinstall -y /files/check-mk-agent-2.1.0p10-1.noarch.rpm \
        && yum clean all \
	&& cp /files/mk_logwatch /usr/lib/check_mk_agent/plugins/ \
	&& cp /files/check-mk-agent /etc/xinetd.d/ \
	&& cp /files/logwatch.cfg /etc/check_mk/ \
	&& cp /files/mk_logins /usr/lib/check_mk_agent/plugins/ \
	&& chmod 744 -R /usr/lib/check_mk_agent/plugins/ \
	&& rm -rf /files

ENTRYPOINT [ "/usr/sbin/xinetd", "-f", "/etc/xinetd.conf", "-dontfork", "-stayalive" ]