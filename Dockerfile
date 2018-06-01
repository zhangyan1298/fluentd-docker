FROM centos:centos6.8
RUN yum -y install redhat-lsb-core initscripts
RUN rpm -ivh http://packages.treasuredata.com.s3.amazonaws.com/3/redhat/6/x86_64/td-agent-3.1.1-0.el6.x86_64.rpm
RUN cp /etc/td-agent/td-agent.conf{,bak}
RUN sed -i /^TD_AGENT_[UG]/s/td-agent$/root/g  /etc/init.d/td-agent
COPY td-agent.conf /etc/td-agent/
CMD ["/usr/sbin/td-agent"]

