#!/usr/bin/env bash

# 実行元チェック
if [ ! -e ./build_assists ]
then
  echo ""
  echo "You must run this script from the project root directory."
  exit 1
fi

# 暗号化データを復号化する (ios)
./build_assists/scripts/decode_from_public.sh encode_app_name_ios.txt decode_app_name_ios.txt PASSWD
if [ $? -ne 0 ]
then
  echo ""
  echo "decoding the app name secret failed."
  exit 1
fi

# 暗号化データを復号化する (android)
./build_assists/scripts/decode_from_public.sh encode_app_name_android.txt decode_app_name_android.txt PASSWD
if [ $? -ne 0 ]
then
  echo ""
  echo "decoding the app name secret failed."
  exit 1
fi

echo "decoding the app name secret success."

# アプリをビルドして実行する。（エミュレータか実機が接続されてること）
flutter run
exit 0