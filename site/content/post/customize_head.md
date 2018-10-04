---
title: Netlify-CMSのhead要素内をカスタマイズする
date: '2018-10-04T22:30:10+09:00'
description: title要素やlink要素を変更して、Netlify-CMSをカスタマイズする方法を探っていきます。
image: ''
---
こんばんは。batapy88です。

前回「[Netlify-CMSにGoogle Analyticsタグを仕込む](https://batapy88.com/post/embed_google_analytics_tag/)」で、Netlify-CMSのhead要素内にGoogle Analyticsタグを仕込みました。

ほかにも、title要素の中身も変更したかったのでした。

## head要素内の該当箇所に変更を加える。

head要素内の該当箇所を変更していきます。

head要素を生成しているhead.htmlの所在は以下。

```
/layout/partial/head.html
```

title要素を変更します。

デフォルトだと珈琲や輸入食品とかをおいてるお店の名前になってます。

```
<title>{{ .Title }} | Kaldi</title>
```

ここを以下のようにお好みに変えます。

```
<title>{{ .Title }} | batapy88.com</title>
```

これでサイトのタイトルも変えられました。

変更前

![tittle_before](/img/title_before.png)

変更後

![title_after](/img/title_after.png)



トップページは、ページのタイトルとサイト名がかぶっちゃってますが、気にしません。

何かいいアイディアが浮かんだら変更することにします。
