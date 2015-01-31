FROM clouderg/meanstack
MAINTAINER admin@cobjet.com

RUN apt-get update && apt-get install -y \
  gcc \
  g++ \
  python \
  make \
  curl 

RUN mkdir -p /tmp/node && cd /tmp/node
WORKDIR /tmp/node
RUN curl -s0 http://nodejs.org/dist/v0.11.16/node-v0.11.16.tar.gz | tar -zx
RUN cd node-v0.11.16
WORKDIR /tmp/node/node-v0.11.16

RUN ./configure
RUN make
RUN make install

ADD src /src
WORKDIR /src
RUN npm install

ENV NODE_PORT 3000
EXPOSE 3000

CMD ["index.js"]
ENTRYPOINT ["node"]
