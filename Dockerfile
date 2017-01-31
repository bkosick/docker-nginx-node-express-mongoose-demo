FROM centos
MAINTAINER bkosick@gmail.com

RUN yum install -y epel-release && \
    yum update -y && \
    yum install -y git nodejs npm ImageMagick && \
    git clone https://github.com/madhums/node-express-mongoose-demo.git

RUN  curl -L https://github.com/docker-infra/reefer/releases/download/v0.0.4/reefer.gz | \
     gunzip > /usr/bin/reefer && chmod a+x /usr/bin/reefer && \
     mkdir /templates

COPY templates/* /templates/
WORKDIR ./node-express-mongoose-demo

RUN sed -i -e "s#mongodb://localhost/noobjs_dev#mongodb://mongo/noobjs_dev#g" config/env/development.js && sed -i -e "s#mongodb://localhost/noobjs_dev#mongodb://mongo/noobjs_dev#g" config/env/test.js

RUN npm install node-imager && \
    npm install

COPY runscript.sh runscript.sh

RUN chmod 755 runscript.sh

EXPOSE 3001

#CMD [ "/node-express-mongoose-demo/runscript.sh" ]
ENTRYPOINT [ "/usr/bin/reefer", \
  "-t", "/templates/package.json.tmpl:/node-express-mongoose-demo/package.json", \
  "-E", \
  "/node-express-mongoose-demo/runscript.sh" ]
