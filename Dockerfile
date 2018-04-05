FROM node:9.10.0-alpine
WORKDIR /src
COPY ./package.json /src
RUN npm install
COPY ./ /src
RUN chmod 700 /src/scripts/export.sh
ENTRYPOINT ["node", "./cli.js"]
