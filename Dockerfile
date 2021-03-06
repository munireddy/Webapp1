#Dockefile for creating a docker image : Ubuntu + Apache + Pyhton + Flask
#Commnet
FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y python3 wget gcc phantomjs 
RUN apt-get update
RUN apt-get install -y python3-pip  

RUN apt-get install -y xvfb

RUN apt-get install -y lynx

RUN apt-get install sudo 

RUN sudo apt install -y vim

RUN sudo pip3 install Flask

RUN pip3 install robotframework
RUN pip3 install robotframework-sshlibrary
RUN pip3 install robotframework-selenium2library
RUN pip3 install Flask-SqlAlchemy
EXPOSE 8000

WORKDIR  /home

RUN  mkdir -pv /home/templates/
ADD app4.py /home
RUN chmod +x /home/app4.py
ADD dummy.py /home
ADD tabledef.py /home
ADD test1.robot /home
RUN /usr/bin/python3  tabledef.py
RUN /usr/bin/python3  dummy.py
 
ADD index.html /home/templates
ADD login1.html /home/templates
ADD index.html /home/templates
ADD index.html /tmp
RUN mkdir -pv /home/static/
ADD style.css /home/static
#ADD  /sbin/ifconfig /home
#ENTRYPOINT ["/usr/bin/python", "app4.py"]
ENTRYPOINT ["nohup", "/usr/bin/python3","/home/app4.py", "&"]
#Added comment to checkin the file.
