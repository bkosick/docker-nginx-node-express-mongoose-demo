#!/bin/bash

ENVFILE=".env"

#Stupid if statements, googles says there should be multiple for loop like solutions, but I couldn't get any to work in 5 minutes
if [[ -v NODE_ENV ]] && [[ $NODE_ENV == "production" ]] ; then
	echo "Running in prod mode"
	touch /node-express-mongoose-demo/.env
else
	if [[ -v FACEBOOK_CLIENTID ]]; then
		echo "FACEBOOK_CLIENTID=${FACEBOOK_CLIENTID}" >> $ENVFILE
	else
		echo 'FACEBOOK_CLIENTID=<ID>' >> $ENVFILE
	fi

	if [[ -v FACEBOOK_SECRET ]]; then
		echo "FACEBOOK_SECRET=${FACEBOOK_CLIENTID}" >> $ENVFILE
	else
		echo 'FACEBOOK_SECRET=<SECRET>' >> $ENVFILE
	fi

	if [[ -v TWITTER_CLIENTID ]]; then
		echo "TWITTER_CLIENTID=${TWITTER_CLIENTID}" >> $ENVFILE
	else
		echo 'TWITTER_CLIENTID=<ID>' >> $ENVFILE
	fi

	if [[ -v TWITTER_SECRET ]]; then
		echo "TWITTER_SECRET=${TWITTER_CLIENTID}" >> $ENVFILE
	else
		echo 'TWITTER_SECRET=<SECRET>' >> $ENVFILE
	fi

	if [[ -v GITHUB_CLIENTID ]]; then
		echo "GITHUB_CLIENTID=${GITHUB_CLIENTID}" >> $ENVFILE
	else
		echo 'GITHUB_CLIENTID=<ID>' >> $ENVFILE
	fi

	if [[ -v GITHUB_SECRET ]]; then
		echo "GITHUB_SECRET=${GITHUB_CLIENTID}" >> $ENVFILE
	else
		echo 'GITHUB_SECRET=<SECRET>' >> $ENVFILE
	fi

	if [[ -v LINKEDIN_CLIENTID ]]; then
		echo "LINKEDIN_CLIENTID=${LINKEDIN_CLIENTID}" >> $ENVFILE
	else
		echo 'LINKEDIN_CLIENTID=<ID>' >> $ENVFILE
	fi

	if [[ -v LINKEDIN_SECRET ]]; then
		echo "LINKEDIN_SECRET=${LINKEDIN_CLIENTID}" >> $ENVFILE
	else
		echo 'LINKEDIN_SECRET=<SECRET>' >> $ENVFILE
	fi

	if [[ -v GOOGLE_CLIENTID ]]; then
		echo "GOOGLE_CLIENTID=${GOOGLE_CLIENTID}" >> $ENVFILE
	else
		echo 'GOOGLE_CLIENTID=<ID>' >> $ENVFILE
	fi

	if [[ -v GOOGLE_SECRET ]]; then
		echo "GOOGLE_SECRET=${GOOGLE_CLIENTID}" >> $ENVFILE
	else
		echo 'GOOGLE_SECRET=<SECRET>' >> $ENVFILE
	fi

	if [[ -v IMAGER_S3_KEY ]]; then
		echo "IMAGER_S3_KEY=${IMAGER_S3_KEY}" >> $ENVFILE
	else
		echo 'IMAGER_S3_KEY=AWS_S3_KEY' >> $ENVFILE
	fi

	if [[ -v IMAGER_S3_SECRET ]]; then
		echo "IMAGER_S3_SECRET=${IMAGER_S3_SECRET}" >> $ENVFILE
	else
		echo 'IMAGER_S3_SECRET=AWS_S3_SECRET' >> $ENVFILE
	fi

	if [[ -v IMAGER_S3_BUCKET ]]; then
		echo "IMAGER_S3_BUCKET=${IMAGER_S3_BUCKET}" >> $ENVFILE
	else
		echo 'IMAGER_S3_BUCKET=AWS_S3_BUCKET' >> $ENVFILE
	fi
fi

# start app
npm start
