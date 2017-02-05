# create image from nodejs base image
FROM node:6

# clone repo from github
RUN git clone https://github.com/dchowitz/digitalocean-node.git

# change working dir to the clone directory
WORKDIR /digitalocean-node

# install all the dependencies
RUN npm install

# expose port
EXPOSE 3000

# run the app
CMD ["npm", "start"]
