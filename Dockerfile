# This file demonstrate the production build react app and install to nginx server
# Usage: 
#   Build: docker build -t manishdubey01/nging-react-app . 
#   Run: docker run -p 3000:80 manishdubey01/nging-react-app 

# Specify base image
FROM node:alpine as builder

#Specify working directory
WORKDIR '/app'

#Install Dependencies
COPY package.json .
RUN npm install
COPY . .

#Run buid command
RUN npm run build

FROM nginx
# EXPOSE 80   #For AWS Elastic Beanstalk
COPY --from=builder /app/build /usr/share/nginx/html

