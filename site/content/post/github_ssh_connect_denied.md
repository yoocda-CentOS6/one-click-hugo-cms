---
title: GitHubとのssh接続が切れて、ハマったのでメモ
date: '2018-10-05T22:28:49+09:00'
lastupdate: '2018-10-05T22:28:49+09:00'
description: こんばんは。batapy88です。GitHubとのssh接続が突然途切れて、かなり困ったのでそのときのメモです。同じように困ってる人の役に立てれば。
---
## 環境

Windows 10 Pro


## 症状

git fetch、git pull、git pushのどれをやっても以下のエラーメッセージが出る。

```
Load key "/c/Users/Username/.ssh/id_rsa": Permission denied
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.
```

## ハマった内容

GitHubのssh and GPG keysには確かにsshキーが登録されている。

原因がわからないのでsshキーペアを作り直すことに。

まずGitHubのリポジトリのSettingsからsshキーを削除し、その後ローカル上のid_rsaを削除した。

その状態からsshキーペアの作成と登録を何度も試みるがことごとく失敗。

![GitHubの公式ヘルプ](https://help.github.com/ja/github/authenticating-to-github/error-permission-denied-publickey)の説明内容を読んでみる。

Windows10なので、cmd.exeで叩いていたが、git-bash.exeでないと公式ヘルプの説明内容についていけないためgit-bash.exeを起動。

システム環境変数を開き、git-bash.exeにPATHを通した。

```
C:\Program Files\Git\git-bash.exe
```

キーペア作成。

```
ssh-keygen -t rsa -b 4096 -C "batapy88@batapy88.com"
```

その状態から秘密鍵登録しようとするも、こんどはsshエージェント起動に失敗。

```
$ ssh-add id_rsa
Could not open a connection to your authentication agent.
```

以下コマンドをgit-bash.exeで入力。

```
$ eval `ssh-agent -s`
```

入力直後にpidが表示されればsshエージェント起動完了。

```
$ eval `ssh-agent -s`
Agent pid 10516
```

再度、秘密鍵登録を試みる。が、今度はアクセス拒否される。

```
$ ssh-add id_rsa
id_rsa: Permission denied
```

アクセス権変更しようとするが、変えられない（Windowsなので当たり前）。

```
chmod 600 id_rsa
chmod: changing permissions of 'id_rsa': Permission denied
```

Windowsエクスプローラーで~/.sshフォルダを開く。

id_rsa、id_rsa.pubを右クリックしてアクセス権を以下のように変更する。
（念のためconfigのアクセス権も変更した）

#### セキュリティタブ

|ユーザー名|許可|拒否|
|---|---|---|
|SYSTEM|全部チェックを入れる|全部チェック外す|
|ドメインアドミニストレーター|全部チェックを入れる|全部チェック外す|
|自分自身|全部チェックを入れる|全部チェック外す|
|ローカルアドミニストレーター|全部チェックを入れる|全部チェック外す|



変更後、再度秘密鍵登録を試みる。今度は登録成功。

```
$ ssh-add ~/.ssh/id_rsa
Identity added: /c/Users/batapy88.com.ad/.ssh/id_rsa (/c/Users/batapy88.com.ad/.ssh/id_rsa)
```

GitHubに接続テスト

```
$ ssh -T git@github.com
Hi batapy88! You've successfully authenticated, but GitHub does not provide shell access.
```

無事つながった。

## 考えられる原因

再現テストをやったわけではないので、参考程度に読んでほしい。

おそらく別に何かの作業（ssh鍵関連か？）をやっているうちに、不用意にコマンドをたたいてしまったか、タスクマネージャー等でssh-agentのプロセスを殺してしまったのではないかと推測している。

ただ、Windowsなので正直なところ何をやってしまったのか、上記の手順で解決はしたもののアクセス権が本当の原因だったのか、は不明なままになってしまっている。

後日、検証できたら続報を記入したい。