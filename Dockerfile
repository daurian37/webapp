FROM ubuntu

LABEL MAINTAINER = "dv.balenvokolo@gmail.com"
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y git nginx
EXPOSE  80

#ADD static-website-example/  /var/www/html/
WORKDIR /var/www/html/

#supprimer le contenu présent dans le repertoire de destination

#RUN mkdir home/testdocker
RUN  rm -Rf /var/www/html/*

#cloner directement le code source sur github
#RUN ls
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html

ENTRYPOINT [ "/usr/sbin/nginx", "-g", "daemon off;" ]
