# this base image contains the necessary things for both yarn and npm
FROM node:8.9

# setup awscli
RUN apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy python-dev python-pip groff-base
RUN pip install awscli

# aws credentials
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_REGION=us-east-2
ARG NODE_ENV=production
ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ENV AWS_REGION=$AWS_REGION
ENV NODE_ENV=$NODE_ENV

CMD [ "node" ]
