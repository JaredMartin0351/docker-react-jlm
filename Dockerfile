FROM node:latest

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH
COPY package.json ./
COPY package-lock.json ./
RUN npm ci
RUN npm install react-scripts@5.0.0 -g



CMD ["npx", "nodemon", "--watch", "src", "--exec", "npm", "start"]