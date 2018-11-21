---
title: nvm、Node.js、npmをWindowsにインストールする
date: '2018-11-21T22:21:48+09:00'
description: >-
  こんばんは、batapy88です。nvm、Node.js、npmをWindowsにインストールする方法をまとめて説明しているページが無かったので、今日はそれを書いてみようと思います。
---
## この説明でインストールするもの

1. nvm （Node.jsのバージョン管理ツール。Node Version Manager。）
2. Node.js （Node.js本体。1.を使ってインストールします。）
3. npm （Node.jsのパッケージマネージャー。Node Package Manager。Node.jsをインストールすると一緒にインストールされます。）

## nvmをインストールする

1. 以下のページからnvm-setup.zipをダウンロードする

https://github.com/coreybutler/nvm-windows/releases

2. ダウンロードしたnvm-setup.zipを解凍する

3. 解凍したフォルダー内のnvm-set-up.exeを実行する
インストールウィザードが起動します。

4. 「次へ」をクリックしてインストールウィザードを進め、最後に「インストール」をクリックする
お使いのコンピューターnvmがインストールされます。

5. コンピューターを再起動する

## nvmのインストール後確認

1. コマンドプロンプトを起動する

2. nvm -v と入力してEnterを押す

バージョンが表示されればnvmは正しくインストールできています。

## Node.jsとnpmのインストール

Node.jsをインストールすると、npmも同時にインストールされます。

1. nvm list available と入力してEnterを押す

2. node install に続けてLTSの最上部に表示されているバージョンを入力する
例えば、node install 10.13.0

## Node.jsとnpmのインストール後確認

1. コマンドプロンプトを起動する

2. node --version と入力してEnterを押す

バージョンが表示されればNode.jsは正しくインストールできています。

3. npm --version と入力してEnterを押す

バージョンが表示されればnpmは正しくインストールできています。

以上でnvm、Node.js、npmのインストールは完了です。


