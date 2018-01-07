FROM node:9.3-alpine

RUN apk add --update --no-cache \
  yarn \
  make 
 
WORKDIR /src/app

COPY package*.json ./

RUN yarn install

EXPOSE 3000

CMD ["yarn", "start"]
