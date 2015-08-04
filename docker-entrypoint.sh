#!/bin/bash -e

# Copy all templates to /etc/nginx/, evaluate them and delete the files
cp -R /templates/* /etc/nginx/
for f in $(find /etc/nginx/ -type f -name "*.j2"); do
    echo -e "Evaluating template\n\tSource: $f\n\tDest: ${f%.j2}"
    j2 $f > ${f%.j2}
    rm -f $f
done
cd /etc/nginx

exec "$@"
