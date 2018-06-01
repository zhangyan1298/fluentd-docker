FROM centos:centos6.8
RUN yum -y install redhat-lsb-core initscripts
RUN rpm -ivh http://packages.treasuredata.com.s3.amazonaws.com/3/redhat/6/x86_64/td-agent-3.1.1-0.el6.x86_64.rpm
RUN cp /etc/td-agent/td-agent.conf{,bak}
RUN rpm -ql td-agent
RUN sed -i /^[UG]/s/td-agent$/root/g  /etc/init.d/td-agent
COPY td-agent.conf /etc/td-agent/
RUN chkconfig  td-agent on
RUN service td-agent start
CMD ['service','td-agent','start']

