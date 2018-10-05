---
title: githubとのssh接続が切れて、ハマったのでメモ
date: '2018-10-05T22:28:49+09:00'
description: GitHubとのssh接続が突然途切れて、かなりこまったのでそのときのメモです。
---

## 症状
git fetch、git pull、git pushすると以下のコマンドが出る。
```
Load key "/c/Users/hirofumi-yoshida.SCIENCE/.ssh/id_rsa": Permission denied
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.
```

## ハマった内容
GitHubのssh and GPG keysには確かにsshキーが登録されている。
怪しいので新たにsshキーペアを作成する。
Windowsなので、cmd.exeで叩いていたが、
git-bash.exeでないオフィシャルの説明についていけないためgit-bash.exeを起動。
システム環境変数を開き、git-bash.eceにPATHを通す。
C:\Program Files\Git\git-bash.exe

キーペア作成。
ssh-keygen -t rsa -b 4096 -C "hirofumi-yoshida@science.co.jp"

秘密鍵登録しようとするも、sshエージェント起動に失敗
ssh-add id_rsa
Could not open a connection to your authentication agent.

以下コマンドをgit-bash.exeで入力
eval `ssh-agent`

入力直後にpidが表示されればsshエージェント起動完了
eval `ssh-agent`
Agent pid 10516

再度、秘密鍵登録を試みる。今度はアクセス拒否される。
$ ssh-add id_rsa
id_rsa: Permission denied

アクセス権変更しようとするが、変えられない(Windowsなので当たり前だが)。
chmod 600 id_rsa
chmod: changing permissions of 'id_rsa': Permission denied

Windowsエクスプローラーで~/.sshフォルダを開く

id_rsa、id_rsa.pubのアクセス権を以下のように変更する
（念のためconfigのアクセス権も変更した）
■セキュリティタブ
ユーザー名 / 許可 / 拒否
SYSTEM / 全部チェックを入れる / 全部チェック外す
ドメインアドミニストレーター / 全部チェックを入れる / 全部チェック外す
自分自身 / 全部チェックを入れる / 全部チェック外す
ローカルアドミニストレーター / 全部チェックを入れる / 全部チェック外す

変更後、再度秘密鍵登録を試みる。今度は登録成功。
$ ssh-add ~/.ssh/id_rsa
Identity added: /c/Users/hirofumi-yoshida.SCIENCE/.ssh/id_rsa (/c/Users/hirofumi-yoshida.SCIENCE/.ssh/id_rsa)

GitHubに接続テスト
$ ssh -T git@github.com
Hi hs-yoshida! You've successfully authenticated, but GitHub does not provide shell access.

無事つながった。
