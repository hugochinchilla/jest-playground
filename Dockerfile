FROM node:20.5-slim

WORKDIR /app

ADD package.json package-lock.json ./
RUN npm ci

