#!/usr/bin/env bash

## copy a site from a remote host

set -e

if [ $1 ]; then
  # get path with a slash at the end.
  REMOTESSH=$(echo $1/ | tr -s /)
  echo "path: $REMOTESSH"
    rsync -chavzP --stats --exclude-from='bin/rsync-exclude' $REMOTESSH wordpress/
else
  echo "What site to sync? SSH format ssh-host.com:public_html/"
  exit 1
fi


# rsync -chavzP --stats --exclude-from='bin/rsync-exclude' staging.appraisalsave.com:app/ sites/app