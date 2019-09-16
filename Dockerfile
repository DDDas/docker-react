FROM node:alpine as builder
WORKDIR /usr/src/reactapp
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
COPY --from=builder /usr/src/reactapp/build /usr/share/nginx/html