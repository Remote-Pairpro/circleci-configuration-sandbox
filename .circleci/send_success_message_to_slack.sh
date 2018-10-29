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
      "image_url": "https://previews.dropbox.com/p/thumb/AANP03t-WAHTTCAcoKgNGMxj7XEsAM-GHWm7jms_Zf1thutO23U61mY1xfFAv69xONCA00K4-Uuw12TVs64nCaQs6_suVDoaPT3TWoDerajJ3K5cGxHyR19JJJJ_U31cdUmy085BKhSNpWB8M27zfImiEzYadMz_8Ix4rtJ_vrH29EQUcGGp7mzpH4bv_iKtxE0d-GEmoOyGV1iRjVXe-TsSCsH-UU8CgS70jIY2IO_MCA/p.png?size=1600x1200&size_mode=3",
      "fields": [
        {
          "title": "${title}",
          "value": "${text}",
          "short": true
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
