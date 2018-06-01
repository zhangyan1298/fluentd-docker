FROM centos
RUN yum -y install redhat-lsb-core initscripts
RUN rpm -ivh http://packages.treasuredata.com.s3.amazonaws.com/3/redhat/7/x86_64/td-agent-3.1.1-0.el7.x86_64.rpm
RUN cp /etc/td-agent/td-agent.conf{,bak}
RUN sed -i /^[UG]/s/td-agent$/root/g  /usr/lib/systemd/system/td-agent.service
COPY td-agent.conf /etc/td-agent/
RUN systemctl enable td-agent
RUN /usr/sbin/init
RUN systemctl start td-agent

