FROM node:latest as build

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH
COPY package.json ./
COPY package-lock.json ./
RUN npm ci
RUN npm install react-scripts@5.0.0 -g

COPY ./ ./
RUN npm run build



###production
FROM nginx:stable-alpine as prod
COPY --from=build /app/build /usr/shar/nginx/html

EXPOSE 80

CMD ["ngnix", "-g", "daemon off;"]