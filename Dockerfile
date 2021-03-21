# FROM node
FROM node:12-alpine

#set working directory
WORKDIR /usr/app

# install ionic/cli
RUN npm install -g @ionic/cli

# copy files
COPY ./app /usr/app/

#expose port
EXPOSE 8100 35729

#command tail -f /dev/null keeps container running

# set user as node
RUN chown -R node:node /usr/app/
USER node

# install dependencies in json
RUN npm cache clean --force && npm install -y
