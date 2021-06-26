FROM node:alpine
WORKDIR '/usr/frontend'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /usr/frontend/out /usr/share/nginx/html
