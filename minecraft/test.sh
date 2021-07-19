#!bin/bash
# Java Installation Egg
# Server Files: /mnt/server

JAVA_VENDOR="11.0.9-trava2"

SDK_MAN_OUT=$($SDKMAN_DIR/bin/sdkman-init.sh && sdk install java $JAVA_VENDOR)

if grep -q foo <<<"$string"; then
    echo "It's there"
fi


echo "$SDK_MAN_OUT"