#!/bin/sh -eu

# Default directory setting. It is overwrite by argument.
SRC_DIR="./src"
DIST_DIR="./dist"

function usage() {
cat <<_EOT_
Usage:
  $0 [-s dirname] [-d dirname]

Description:
  hogehogehoge

Options:
  -s    source dir name
  -d    dist dir name
_EOT_
exit 1
}

function usage_exit() {
  echo "Usage: $0 [-s dirname] [-d dirname]" 1>&2
  exit 1
}

while getopts s:t: OPT
do
    case $OPT in
        s)  SRC_DIR=$OPTARG;
            ;;
        t)  DIST_DIR=$OPTARG;
            ;;
        \?) usage_exit
            ;;
    esac
done

# shift $((OPTIND - 1))

echo "source_dir=${SRC_DIR}"
echo "dist_dir=${DIST_DIR}"

if [ "$COMSPEC" = "" ]; then
  echo "[Error] Sorry. This tool is only windows environment."
  exit 1
fi

for file in `\find ${SRC_DIR} -type f | awk -F/ '{print $NF}'`; do
  ./bin/nkf32.exe -w ${SRC_DIR}/${file} > ${SRC_DIR}/utf8/${file}
done

#gulp
