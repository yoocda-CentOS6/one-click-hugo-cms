---
title: nvm、Node.js、npmをWindowsにインストールする
date: '2018-11-21T22:21:48+09:00'
description: >-
  こんばんは、batapy88です。nvm、Node.js、npmをWindowsにインストールする方法をまとめて説明しているページが無かったので、今日はそれを書いてみようと思います。
---
## この説明でインストールできるもの

1. nvm （Node.jsのバージョン管理ツールです。*Node Version Manager* の略です。）
2. Node.js （Node.jsの本体です。nvmを使ってインストールします。）
3. npm （Node.jsのパッケージマネージャーです。*Node Package Manager* の略です。Node.jsをインストールするとき一緒にインストールします。）

## nvmをインストールする

Windowsの場合、先にC:\直下にworkspaceフォルダを作っておくほうが良いです。

1. 以下のページからnvm-setup.zipのV1.1.7以降をダウンロードする

    https://github.com/coreybutler/nvm-windows/releases

    - 2019年6月更新：V1.1.7より前では、npmが正常にインストールできないためインストール中に必ずエラーになります。

2. ダウンロードしたnvm-setup.zipを解凍する

3. 解凍したフォルダー内のnvm-set-up.exeを実行する

    インストールウィザードが起動します。

4. nvmをインストールするフォルダを「C:\workspace\nvm」に変更して「次へ」をクリックする

    ![nvm01.png](/img/nvm01.png)

5. Node.jsをインストールするフォルダを「C:\workspace\nodejs」に変更して「次へ」をクリックする

    ![nvm02.png](/img/nvm02.png)

6. 最後に「インストール」をクリックする

    nvmがインストールされます。

## nvmのインストール後確認

1. コマンドプロンプトに `nvm -v` を入力してEnterを押す

    ```
    C:\Users\YourUserName>nvm -v
    ```

    英文がたくさん表示されますが、その先頭のほうにバージョンが表示されていれば、nvmは正しくインストールできています。

    ```
    C:\Users\YourUserName>nvm -v

    Running version 1.1.7.

    Usage:

      nvm arch                     : Show if node is running in 32 or 64 bit mode.
      nvm install <version> [arch] : The version can be a node.js version or "latest" for the latest stable version.

      （以下省略）
    ```

## Node.jsとnpmのインストール

   次にNode.jsと、npmをインストールします。

1. `nvm list available` を入力してEnterを押す

    ```
    C:\Users\YourUserName>nvm list available
    ```

    現在インストールできるNode.jsが一覧で表示されます。

    だいたいの場合はLTSの一番上に表示されているバージョンを使えばOKです。

2. `nvm install` に続けてバージョンとビット数を入力してEnterを押す

    ビット数のところは、使っているPCのビット数（64bitまたは32bit）に合わせて「64」または「32」を入力します。
    64bitの場合は、入力を省略することもできます。
    32bitの場合は、必ず入力しましょう。

    ```
    C:\Users\YourUserName>node install 10.16.0 32
    ```

    Node.jsとnpmがインストールされます。

## Node.jsとnpmのインストール後確認

1. コマンドプロンプトに `node -v`と入力してEnterを押す

    ```
    C:\Users\YourUserName>node -v
    ```

    バージョンが表示されればNode.jsは正しくインストールできています。

    ```
    C:\Users\YourUserName>node -v
    v10.16.0
    ```

3. `npm -v`と入力してEnterを押す

    ```
    C:\Users\YourUserName>npm -v
    ```

    バージョンが表示されればnpmは正しくインストールできています。

    ```
    C:\Users\YourUserName>npm -v
    6.9.0
    ```

以上でnvm、Node.js、npmのインストールは完了です。


