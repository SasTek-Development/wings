#!/bin/bash
JAVA_VENDORS=("16.0.1.hs-adpt" "11.0.11.hs-adpt" "8.0.292.hs-adpt" "11.0.9-trava" "8.0.232-trava")

if [ ! -f "generated" ]; then
    mkdir "generated"
fi

cd "generated" || exit
rm *

for i in "${!JAVA_VENDORS[@]}";
do
  VENDOR=${JAVA_VENDORS[$i]}
  echo "$VENDOR"
  # shellcheck disable=SC2091
  $(mkdir "$VENDOR")
  sed "s/%%VENDOR%%/$VENDOR/" ../base_image > "$VENDOR"/Dockerfile

done