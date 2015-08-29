FROM node:0.10

ADD . /app
WORKDIR /app

RUN npm install --production
CMD npm run app

