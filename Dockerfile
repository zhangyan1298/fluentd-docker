FROM centos:centos6.8
RUN yum -y install redhat-lsb-core initscripts
RUN rpm ivh http://packages.treasuredata.com.s3.amazonaws.com/2/redhat/6/x86_64/td-agent-2.3.6-0.el6.x86_64.rpm
RUN cp /etc/td-agent/td-agent.conf{,bak}
RUN sed -i /^[UG]/s/td-agent$/root/g  /usr/lib/systemd/system/td-agent.service
COPY td-agent.conf /etc/td-agent/
RUN chkconfig  td-agent on
RUN service td-agent start

