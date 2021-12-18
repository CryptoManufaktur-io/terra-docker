#!/bin/sh
SYNC=$(curl -s -m2 -N -X GET -H "accept: application/json" "https://${HAPROXY_SERVER_NAME}/syncing")
echo "${SYNC}" | grep -q "syncing"
if [ $? -ne 0 ]; then
  return 1
fi
SYNC=$(echo "${SYNC}" | jq .syncing)
if [ "${SYNC}" = "false" ]; then
  return 0
else
  return 1
fi

