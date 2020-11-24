#!/usr/bin/env bash

# help
Help() {
	echo "入力環境変数内容 BASE64デコード出力"
	echo ""
	echo "decode_from_private.sh 入力環境変数名 出力ファイル名"
	echo "　'入力環境変数名' に設定された BASE64テキストをデコードして、"
	echo "　'decode_private/出力ファイル名' にデコードファイルとして出力します。"
	echo ""
}

# success end
success() {
  cd $WORK_DIR
  WORK_DIR=
  exit 0
}

# failed end
failed() {
  cd $WORK_DIR
  WORK_DIR=
  exit 1
}

# 実行元チェック
if [ ! -e ./build_assists ]
then
  echo ""
  echo "You must run this script from the project root directory."
  exit 1
fi

#オプションチェック
if [ $# -eq 2 ]
then
  # 作業ディレクトリ変更
  WORK_DIR=`pwd`
  cd ./build_assists/scripts

  # 入力環境変数名の値を取得
  __TEMP_VAR__=`eval echo '$'$1`

	# 入力環境変数名チェック
	if [ -z $__TEMP_VAR__ ]
	then
    echo ""
    echo "variable $1 is not exist in this environment."
    failed
	fi

	# 出力先ディレクトリチェック
	if [ ! -e ../decode_private ]
	then
		mkdir ../decode_private
	fi

  # base64デコード
  echo "$__TEMP_VAR__" | base64 -d -o ../decode_private/"$2"
	if [ $? -ne 0 ]
	then
    echo ""
    echo "$1 file decode was failed."
    failed
	fi

  # BASE64デコード出力成功
  echo ""
	echo "decoding the encoded $1 environment variable into a $2 file was successful."
  __TEMP_VAR__=

  success
fi

# オプション指定違い
Help
exit 1
