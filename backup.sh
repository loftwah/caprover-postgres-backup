set -ex

fname=$(date +"%Y-%m-%d_%I-%M-%S_%p").dump
pg_dump -Fc -f "$fname"
gsutil cp file://"$fname" "$BUCKET_PATH"
