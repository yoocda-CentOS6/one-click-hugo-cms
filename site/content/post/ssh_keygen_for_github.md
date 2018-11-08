---
title: GitHub用のSSHキーを生成する
date: '2018-11-07T22:38:46+09:00'
description: こんばんは、batapy88です。今日はGitHubを使う上で欠かせないSSHキーの生成方法をメモします。
---

## SSHキーを作る

1. コマンドプロンプトまたはターミナルを起動する

2. 自分（OSにログインしているユーザー）のホームディレクトリに移動する

3. 以下のコマンドを実行する

    ```
    mkdir .ssh
    cd .ssh
    ```

4. 以下コマンドの"username@gmail.com"の部分を、自分のgithubアカウントのメルアドに置換したコマンドを実行する

    ```
    ssh-keygen -t rsa -C "username@gmail.com" -N ""
    ```

5. 「Enter file in which to save the key (C:Users\username/.ssh/id_rsa):」というメッセージが表示されるので、何も入力しないでそのままEnterを押す
    以下のような画面が表示されます。

    ![image2018-10-15_18-33-4.png](/img/image2018-10-15_18-33-4.png)

 
これでSSH keyの生成は完了です。
