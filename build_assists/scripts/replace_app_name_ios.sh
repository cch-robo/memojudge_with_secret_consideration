#!/usr/bin/env bash

# Info.plist を置換することでアプリ名を変更します。
# このスクリプトを、Xcode 処理から呼び出してもらうには、
# Xcode > Runner > TARGETS Runner > Build Phases > Run script 項目に、
# '/bin/sh "$FLUTTER_APPLICATION_PATH/build_assists/scripts/replace_app_name_ios.sh"'
# …を追加して、ビルド前にスクリプトを呼び出してもらえるようにします。
#
# アプリ名を変更するため、
# アプリ名の定義を含む Info.plist ファイルを直接置換します。

# 実行元チェック (ios/)
if [ ! -e ../ios ]
then
  echo ""
  echo "You must run this script from 'ios/' directory."
  exit 1
fi

# 秘匿情報復元アプリ名チェック
if [ ! -e $FLUTTER_APPLICATION_PATH/build_assists/decode_private/decode_app_name_ios.txt ]
then
  echo ""
  echo "The App name information restored from secret is not exist."
  exit 0
fi

# Info.plist ファイルを直接置換して、アプリ名を置換する。
cp ../build_assists/decode_private/decode_app_name_ios.txt Runner/info.plist

echo "replaced the app name successfully."
exit 0