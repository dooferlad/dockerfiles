FROM ubuntu
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python python-dev python-django python-beautifulsoup openssh-server git python-pip sudo vim supervisor mongodb python-pymongo uwsgi uwsgi-plugin-python
RUN pip install ujson python-social-auth
RUN cd /srv

RUN git clone https://github.com/dooferlad/need-input.git /srv/roadmap

ADD ./supervisord.conf /etc/supervisord.conf
ADD ./setup.sh /usr/local/bin/setup.sh
ADD ./local_settings.py /srv/roadmap/
ADD ./query.json /srv/roadmap/
ADD ./sshd_config /etc/ssh/

#RUN useradd -G sudo --create-home --user-group --shell /bin/bash dooferlad
#RUN echo 'dooferlad:12qwaszx'| chpasswd
ADD https://launchpad.net/~dooferlad/+sshkeys /root/authorized_keys

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

EXPOSE 22 80 443

CMD ["/usr/bin/supervisord"]
