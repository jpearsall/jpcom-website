#!/usr/bin/env bash

HUGO_VERSION="0.133.0"
HUGO_EXEC="${HOME}/tools/hugo_${HUGO_VERSION}/hugo.exe"

HUGO_DOMAIN_DEV="staging.johnpearsall.com"
HUGO_DOMAIN_PROD="johnpearsall.com"

function usage() {
  echo "$0 { dev | prod | deploy-dev | deploy-prod }"
}

if [[ $# -lt 1 ]]
then
  usage
  exit 1
fi

case "$1" in
	'dev')
	  ${HUGO_EXEC} server -D --buildDrafts -b "https://${HUGO_DOMAIN_DEV}" --appendPort=false -p 80
	  ;;
	'prod')
	  ${HUGO_EXEC} server -D --buildDrafts -b "https://${HUGO_DOMAIN_PROD}" --appendPort=false -p 80
	  ;;
	'deploy-dev')
	  if ! grep -rq "${HUGO_DOMAIN_DEV}" public/*
	  then
	      echo "Hugo site is in prod mode, run \"$(basename $0) dev\" before deploying!"
	      exit 1
	  fi
	  ${HUGO_EXEC} deploy --target=staging
	  ;;
	'deploy-prod')
	  if grep -rq "${HUGO_DOMAIN_DEV}" public/*
	  then
	      echo "Hugo site is in dev mode, run \"$(basename $0) prod\" before deploying!"
	      exit 1
	  fi
	  ${HUGO_EXEC} deploy --target=production
	  ;;
esac
