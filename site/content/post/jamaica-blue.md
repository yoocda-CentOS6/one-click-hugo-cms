---
title: Netlify-CMSのhead要素内をカスタマイズする
date: '2018-10-04T22:30:10+09:00'
description: title要素やlink要素を変更して、Netlify-CMSをカスタマイズする方法を探っていきます。
---
こんばんは。batapy88です。

前回「[Netlify-CMSにGoogle Analyticsタグを仕込む](https://batapy88.com/post/embed_google_analytics_tag/)」で、Netlify-CMSのhead要素内にGoogle Analyticsタグを仕込みました。

前々回の「[Netlify-CMSのCSSを上書きしてカスタマイズする](https://batapy88.com/post/customize_css/)」でも、既存のCSSに追記するのではなく、自分用のCSSへの参照を追記してあげれば良かったわけです。

ほかにも、title要素の中身も変更したかったのでした。

head要素内の該当箇所を変更していきます。

まず、自分用のCSSへの参照を追記

```
<link rel="stylesheet" href="/css/main.css" />
```

のすぐ下に一行追記します。

```
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet" href="/css/custom.css" />
```

こうなります。

次に、title要素を変更します。

デフォルトだと珈琲店？輸入食品店？のなまえになってます。

```
<title>{{ .Title }} | Kaldi</title>
```

ここを以下のようにお好みに変えます。

```
<title>{{ .Title }} | batapy88.com</title>
```

これでサイトのタイトルも変えられました。

変更前

![]()

変更後
