FROM node:20-alpine AS build

ADD . /work
WORKDIR /work

RUN npm ci && npm run build

FROM nginx:stable-alpine-slim
USER nginx
COPY --from=build /app/dist /usr/share/nginx/html
