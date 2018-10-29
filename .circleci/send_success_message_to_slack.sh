#!/bin/bash

title=''
text=''

for OPT in "$@"
do
    case $OPT in
        '-t' )
            title=${2}
            ;;
        '-v' )
            text=${2}
            ;;
    esac
    shift
done

# send_jeson=$(cat << EOS
# {
#   "text": "${message}"
# }
# EOS
# )

send_json=$(cat << EOS
{
  "attachments": [
    {
      "color": "#36a64f",
      "fields": [
        {
          "title": "${title}",
          "value": "${text}",
          "short": false
        }
      ]
    }
  ]
}
EOS
)

curl -X POST \
  ${SLACK_WEBHOOK_URL} \
  -H 'content-type: application/json' \
  -d "${send_json}"
