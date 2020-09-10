# Phase one build
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Phase two production
FROM nginx
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html
