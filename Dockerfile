FROM node:22-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run generate

FROM nginx:alpine

COPY --from=build /app/.output/public /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]