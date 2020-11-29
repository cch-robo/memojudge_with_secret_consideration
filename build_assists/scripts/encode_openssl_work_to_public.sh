#!/usr/bin/env bash

# help
Help() {
	echo "入力ファイル OpenSSLエンコード出力"
	echo ""
	echo "encode_openssl_work_to_public.sh 入力ファイル名 出力ファイル名 パスワード"
	echo "　'work_private/入力ファイル名' のファイルを OpenSSLでエンコードして、"
	echo "　'encode_public/出力ファイル名' にエンコードファイルを出力します。"
	echo "　任意名の環境変数にパスワードを設定してシークレット情報として御利用ください。"
	echo "　注意）エンコードに成功すると 'work_private' の入力ファイルは削除されます。"
	echo "　備考）エンコード(暗号化)は、AES256(SALT付)のパスワード(共通鍵)形式で行います。"
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

# 入力元ディレクトリチェック
if [ ! -e build_assists/work_private ]
then
  mkdir build_assists/work_private
  echo "The 'build_assists/work_private/' directory is not exist,  you must create it."
  failed
fi

# プラットフォームチェック
if [ -f /System/Applications/App\ Store.app/Contents/MacOS/App\ Store  ]
then
  WHICH_OPENSSL=`which openssl`
  if [ $WHICH_OPENSSL = '/usr/bin/openssl' ]; then
    echo 'You must install a openssl by homebrew and add [$(brew --prefix openssl)/bin] into PATH.'
    exit 1
  fi
fi

#オプションチェック
if [ $# -eq 3 ]
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
	if [ ! -e ../encode_public ]
	then
		mkdir ../encode_public
	fi

  # opensslエンコード
  openssl enc -aes-256-cbc -e -pbkdf2 -iter 100000 -base64 -salt -in ../work_private/"$1" -out ../encode_public/"$2" -pass pass:$3
	if [ ! -e ../encode_public/"$2" ]
	then
    echo ""
    echo "$2 file encoding was failed."
    failed
	fi

  # OpenSSLエンコード出力成功
  echo ""
	echo "encoding the $1 file was successful."
  __TEMP_VAR__=

  # 入力元秘匿情報ファイルを削除
  rm ../work_private/"$1"
  echo ""
  echo "$1 file was removed."

  success
fi

# オプション指定違い
Help
exit 1
