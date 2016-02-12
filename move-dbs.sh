#!/bin/bash

echo "Reading dbmap config...." >&2
source "${BASH_SOURCE%/*}/dbmap.cfg"

# For each database in the dbmap.cfg file - import
# TODO: need to add script options to replace [site] and [env]
for i in "${!databasemap[@]}"
do
  echo "humanreadable db name[key]: $i"
  echo "site uri[value]: ${databasemap[$i]}"
  drush @[sitegroup].[env] ah-db-import --db=$i --drop --force ~/export-dbs/${databasemap[$i]}.sql.gz
done

