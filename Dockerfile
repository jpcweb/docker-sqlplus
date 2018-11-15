FROM centos

RUN yum install -y libaio
ADD oracle-instantclient18.3-basic-18.3.0.0.0-1.x86_64.rpm oracle-instantclient18.3-basic-18.3.0.0.0-1.x86_64.rpm
ADD oracle-instantclient18.3-sqlplus-18.3.0.0.0-1.x86_64.rpm oracle-instantclient18.3-sqlplus-18.3.0.0.0-1.x86_64.rpm

RUN rpm -ivh oracle-instantclient18.3-basic-18.3.0.0.0-1.x86_64.rpm oracle-instantclient18.3-sqlplus-18.3.0.0.0-1.x86_64.rpm

RUN echo "export LD_LIBRARY_PATH=/usr/lib/oracle/18.3/client64/lib" >> ~/.bashrc
RUN echo "export PATH=$PATH:/usr/lib/oracle/18.3/client64/bin" >> ~/.bashrc

CMD source ~/.bashrc; echo "sqlplus $CSTR"; sqlplus $CSTR

