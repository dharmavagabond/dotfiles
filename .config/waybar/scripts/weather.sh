curl --max-time=20 https://wttr.in/?format=1 | jq --compact-output --unbuffered -R 'split(" ") | map(select(length > 0)) | {text: .[0], tooltip: .|=join(" ")}'
