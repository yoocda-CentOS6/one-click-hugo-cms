---
title: GitHubとTRAVIS CIの連携が切れた
date: '2018-10-07T09:48:50+09:00'
description: こんにちは。batapy88です。GitHubと連携させているTRAVI CIが急に動かなくなってはまったのでそのときのメモです。
---
## 症状
さっきまで動いていたGitHubとTRAVIS CIの連携が突然切れた

## ハマった点
* GitHubにプッシュしてもTRAVIS CIが反応しない。
* Build History画面でさっき成功したBuildの上に、新しいBuildが表示されない。

## 解決
TRAVIS CI管理画面右の「More options」メニューから「Requests」をクリックしたら別画面に遷移。

画面上に動かなくなったあとにプッシュした履歴（連動しなかったプッシュした履歴）が表示された。

エラーメッセージは以下。

```
Could not parse .travis.yml
```

「.travis.ymlがパースできない」とのこと。

エラーメッセージをGoogle先生で検索したら、同じようなことで困っている人を発見。

[https://stackoverflow.com/questions/50551277/could-not-parse-travis-yml](https://stackoverflow.com/questions/50551277/could-not-parse-travis-yml)

この人はPythonだ。自分の.travis.ymlはRubyで書いてある。
Pythonだと、改行（改行コード）をやめて一行にしたら動いたようだ。

自分のRubyを見てみる。

怪しげなところを発見。

一部分だけ、行頭インデントがスペース2個ではなく、タブになっている。
```
	- ls
	- cd source
```

その箇所をスペース2個に置換して再度GitHubにプッシュ。

今度はTRAVIS CIも連動した！

たったこれだけのことで、調べるのにどんだけかかったことか（T^T）

タブとスペースの混在には気を付けよう。

## 追記

TRAVIS CIに食わせるリポジトリ上のMakefileは行頭インデントはタブじゃないとダメなので注意。

NG

```
  redpen -f asciidoc source/*.adoc
```


OK

```
	redpen -f asciidoc source/*.adoc
```

