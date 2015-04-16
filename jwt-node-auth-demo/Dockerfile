FROM iojs:onbuild
MAINTAINER Alfonso Gonzalez <alfonso@offsidegaming.com>

WORKDIR /app
ADD package.json /app/
RUN npm install
ADD . /app

EXPOSE 4000

CMD ["iojs", "server.js"]
