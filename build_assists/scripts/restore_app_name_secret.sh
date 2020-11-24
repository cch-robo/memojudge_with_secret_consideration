#!/usr/bin/env bash

# 実行元チェック
if [ ! -e ./build_assists ]
then
  echo ""
  echo "You must run this script from the project root directory."
  exit 1
fi

# 暗号化データを復号化する
./build_assists/scripts/decode_from_public.sh encode_app_name.txt decode_app_name.txt PASSWD
if [ $? -ne 0 ]
then
  echo ""
  echo "decoding the app name secret failed."
  exit 1
fi

echo "decoding the app name secret success."
exit 0