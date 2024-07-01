FROM node:20-alpine AS build

ADD . /work
WORKDIR /work

RUN npm ci && npm run build

FROM nginx:stable-alpine-slim
USER nginx
COPY --from=build /work/dist /usr/share/nginx/html
