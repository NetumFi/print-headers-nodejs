# Builder image
FROM node:13.0-alpine AS builder

RUN mkdir -p /build
WORKDIR /build

COPY package*.json ./
RUN npm install

COPY src/ src/
COPY tsconfig.json ./

RUN npm run build

# main Docker image
FROM node:13.0-alpine

LABEL version="0.2.0"
LABEL "fi.netum"="Netum Oy"
LABEL maintainer="oliver@netum.fi"
LABEL description="This project prints the headers of a request to std out."

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY --from=builder /build/package.json /usr/src/app/package.json
COPY --from=builder /build/dist /usr/src/app/dist
COPY --from=builder /build/node_modules /usr/src/app/node_modules

EXPOSE 3001
CMD ["npm", "run", "start"]