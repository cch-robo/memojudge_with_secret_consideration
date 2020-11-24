#!/usr/bin/env bash

# help
Help() {
	echo "入力ファイル BASE64エンコード出力"
	echo ""
	echo "encode_base64_work_to_private.sh 入力ファイル名 出力ファイル名"
	echo "　'work_private/入力ファイル名' のファイルを BASE64 エンコードして、"
	echo "　'encode_private/出力ファイル名' を作成し、エンコードテキストを出力します。"
	echo "　任意名の環境変数に出力テキストを設定してシークレット情報として御利用ください。"
	echo "　注意）エンコードに成功すると 'work_private' の入力ファイルは削除されます。"
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

	# 入力元ファイルチェック
	if [ ! -e ../work_private/"$1" ]
	then
    echo ""
    echo "$1 file is not exist in 'work_private/' directory."
		failed
	fi

	# 出力先ディレクトリチェック
	if [ ! -e ../encode_private ]
	then
		mkdir ../encode_private
	fi

  # base64エンコード
  base64 -i ../work_private/"$1" -o ../encode_private/"$2"
	if [ ! -e ../encode_private/"$2" ]
	then
    echo ""
    echo "$2 file encoding was failed."
		failed
	fi

  # BASE64エンコードテキスト出力
  echo ""
	echo "encoded $1 file text is »»»»»"
	cat ../encode_private/"$2"
	echo "«««««"

  # 入力元秘匿情報ファイルを削除
  rm ../work_private/"$1"
  echo ""
  echo "$1 file was removed."

  success
fi

# オプション指定違い
Help
exit 1
