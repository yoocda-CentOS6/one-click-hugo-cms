---
title: nvm、Node.js、npmをWindowsにインストールする
date: '2018-11-21T22:21:48+09:00'
description: >-
  こんばんは、batapy88です。nvm、Node.js、npmをWindowsにインストールする方法をまとめて説明しているページが無かったので、今日はそれを書いてみようと思います。
---
## この説明でインストールできるもの

1. nvm （Node.jsのバージョン管理ツールです。*Node Version Manager*の略です。）
2. Node.js （Node.jsの本体です。nvmを使ってインストールします。）
3. npm （Node.jsのパッケージマネージャーです。*Node Package Manager*の略です。Node.jsをインストールすると一緒にインストールされます。）

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

2. `nvm -v`を入力してEnterを押す

    ```
    C:\Users\YourUserName>nvm -v
    ```

   英文がたくさん表示されますが、その先頭のほうまで戻って以下のようにバージョンが表示されていれば、nvmは正しくインストールできています。

    ```
    C:\Users\YourUserName>nvm -v
    
    Running version 1.1.5.

    Usage:

      nvm arch                     : Show if node is running in 32 or 64 bit mode.
      nvm install <version> [arch] : The version can be a node.js version or "latest" for the latest stable version.

      （以下省略）
    ```

## Node.jsとnpmのインストール

   Node.jsをインストールすると、npmも同時にインストールされます。

1. `nvm list available`を入力してEnterを押す

   ```
   C:\Users\YourUserName>nvm list available
   ```

2. `node install`に続けてLTSの最上部に表示されているバージョンを入力してEnterを押す

   ```
   C:\Users\YourUserName>node install 10.13.0
   ```

   Node.jsとnpmがインストールされます。

## Node.jsとnpmのインストール後確認

1. コマンドプロンプトを起動する

2. `node --version`と入力してEnterを押す

   ```
   C:\Users\YourUserName>node --version
   ```

   バージョンが表示されればNode.jsは正しくインストールできています。

   ```
   C:\Users\YourUserName>node --version
   v10.13.0
   ```

3. `npm --version`と入力してEnterを押す

   ```
   C:\Users\YourUserName>npm --version
   ```

   バージョンが表示されればnpmは正しくインストールできています。

   ```
   C:\Users\YourUserName>npm --version
   5.6.0
   ```

以上でnvm、Node.js、npmのインストールは完了です。


