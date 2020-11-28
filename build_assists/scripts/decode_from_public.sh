#!/usr/bin/env bash

# help
Help() {
	echo "暗号化データ OpenSSLデコード出力"n
	echo ""
	echo "decode_from_public.sh 入力ファイル名 出力ファイル名 パスワード環境変数名"
	echo "　'encode_public/入力ファイル名' の暗号化データを パスワード内容で復号化して、"
	echo "　'decode_private/出力ファイル名' にデコードファイルとして出力します。"
	echo "　備考）デコード(複合化)は、AES256のパスワード(共通鍵)形式で行います。"
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
if [ $# -eq 3 ]
then
  # 作業ディレクトリ変更
  WORK_DIR=`pwd`
  cd ./build_assists/scripts

  # パスワード環境変数名の値を取得
  export __TEMP_VAR__=`eval echo '$'$3`

	# パスワード環境変数名チェック
	if [ -z $__TEMP_VAR__ ]
	then
    echo ""
    echo "variable $3 is not exist in this environment."
    failed
	fi

	# 入力元ファイルチェック
	if [ ! -e ../encode_public/"$1" ]
	then
    echo ""
    echo "$1 file is not exist in 'encode_public/' directory."
    failed
	fi

	# 出力先ディレクトリチェック
	if [ ! -e ../decode_private ]
	then
		mkdir ../decode_private
	fi

  # opensslデコード
  openssl enc -aes-256-cbc -d -pbkdf2 -iter 100000 -base64 -in ../encode_public/"$1" -out ../decode_private/"$2" -pass env:__TEMP_VAR__
	if [ $? -ne 0 ]
	then
    echo ""
    echo "$1 file decode was failed."
    failed
	fi

  # OpenSSLデコード出力成功
  echo ""
	echo "decoding the encoded $1 file into a $2 file was successful."
  export __TEMP_VAR__=

  success
fi

# オプション指定違い
Help
exit 1
