#!/usr/bin/env bash

# AndroidManifest.xml に定義されたアプリ名を置換します。
# このスクリプトを、android/app/build.gradle 処理から呼び出してもらうには、
# プロジェクト評価後（ビルド直前）にスクリプトを呼び出してもらえるよう、
# app/build.gradle 中に、以下のような関数の追加が必要です。
# def replace_app_name() {
#     exec {
#         commandLine 'sh', '-c', '../../build_assists/scripts/replace_app_name_android.sh'
#     }
# }
# project.afterEvaluate {
#     replace_app_name()
# }

# 実行元チェック (android/app/build.gradle)
if [ ! -e ../../android ]
then
  echo ""
  echo "You must run this script from 'android/app/build.gradle' file."
  exit 1
fi

# 秘匿情報復元アプリ名チェック
if [ ! -e ../../build_assists/decode_private/decode_app_name.txt ]
then
  echo ""
  echo "The App name information restored from secret is not exist."
  exit 0
fi

# AndroidManifest.xml ファイルを直接編集して、アプリ名を置換する。
APP_NAME=`cat ../../build_assists/decode_private/decode_app_name.txt`
PATTERN="s/android:label=\".*\"/android:label=\"$APP_NAME\"/"
sed -e "$PATTERN" src/main/AndroidManifest.xml > __TEMP_FILE__
cp __TEMP_FILE__ src/main/AndroidManifest.xml
rm __TEMP_FILE__
PATTERN=
APP_NAME=

echo "replaced the app name successfully."
exit 0