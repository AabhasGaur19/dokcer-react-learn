#Build phase
FROM node:18-alpine as builder

WORKDIR '/app'

COPY ./package.json ./
RUN npm install 
COPY ./ ./

RUN npm run build

#Run phase
FROM nginx
#look this command from the ngnix from docs
COPY --from=builder /app/build /usr/share/nginx/html 