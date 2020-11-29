#!/usr/bin/env bash

# Info.plist に定義されたアプリ名を置換します。
# このスクリプトを、Xcode 処理から呼び出してもらうには、
# Xcode > Runner > TARGETS Runner > Build Phases > Run script 項目に、
# '/bin/sh "$FLUTTER_APPLICATION_PATH/build_assists/scripts/rewrite_app_name_ios.sh"'
# …を追加して、ビルド前にスクリプトを呼び出してもらえるようにします。
#
# アプリ名を変更するため、
# アプリ名を定義する ios/Runner/Info.plist の 'CFBundleName'キーの値を直接編集します。

# 秘匿情報復元アプリ名チェック
if [ ! -e $FLUTTER_APPLICATION_PATH/build_assists/decode_private/decode_app_name.txt ]
then
  echo ""
  echo "The App name information restored from secret is not exist."
  exit 0
fi

# Info.plist ファイルを直接編集して、アプリ名を置換する。
APP_NAME=`cat $FLUTTER_APPLICATION_PATH/build_assists/decode_private/decode_app_name.txt`
# 左端のマッチにより、抽出開始行を選択して、N; により左辺行全体をバッファに入れて次行に移る。
# BSD sed の改行出力に難があるため、改行出力等のエスケープ文字扱いは tr に移譲しています。
PATTERN="/<key>CFBundleName<\/key>/ N; s/>CFBundleName<.*<string>.*</>CFBundleName<\/key>#%<string>$APP_NAME</"
sed -e "$PATTERN" Runner/Info.plist | tr '#%' '\n\t' > __TEMP_FILE__
cp __TEMP_FILE__ Runner/Info.plist
rm __TEMP_FILE__
PATTERN=
APP_NAME=

echo "rewrite the app name successfully."
exit 0