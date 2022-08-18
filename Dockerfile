### build phase ###
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build


### run phase ###
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# default command of nginx container will start nginx so
# don't need to explicitly run it

# docker build .
# docker run -it -p 8080:80 IMAGE_ID