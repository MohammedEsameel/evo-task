FROM python:3.8-slim-buster

# Install dependencies:
RUN apt-get update
RUN apt-get upgrade -y
RUN pip install kafka 
RUN pip install kafka-python 
RUN pip install faker
RUN pip install -U kafka-python

RUN apt-get install supervisor -y
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD consumer.py /
ADD kill.py /usr/bin/kill.py
#Set proper ownership and permissions
RUN chmod +x /usr/bin/kill.py

CMD ["/usr/bin/supervisord"]

