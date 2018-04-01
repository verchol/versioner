FROM node:9.10.0-alpine
WORKDIR /src
COPY ./package.json /src
RUN npm install
COPY ./ /src
ENTRYPOINT ["node", "./cli.js"]
