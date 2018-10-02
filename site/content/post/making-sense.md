---
title: Netlify-CMSのCSSを上書きしてカスタマイズする
date: '2018-10-02T23:50:00+09:00'
description: Netrify-CMSのCSSを上書きして、思い通りにカスタマイズする方法を探っていきます。
image: /img/blog-flavor_wheel.jpg
---
Netlify-CMSでサイトを立ち上げるとこまではできました。

次は、デフォルトテンプレートのデザインを自分の好みに変えたいです。
さて、CSSはどこだ？CSSを探します。

headタグ内は以下のようになっていました。

```
<head>
	<meta name="generator" content="Hugo 0.31">
	<title>exsample.com | Sample</title>
	<link rel="stylesheet" href="/css/main.css">
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,700" rel="stylesheet">
	<link rel="apple-touch-icon" sizes="180x180" href="/img/apple-touch-icon.png">
	<link rel="icon" type="image/png" href="/img/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="/img/favicon-16x16.png" sizes="16x16">
	<link rel="manifest" href="/manifest.json">
	<link rel="mask-icon" href="/img/safari-pinned-tab.svg" color="#ff4400">
	<meta name="theme-color" content="#fff">
	<meta property="og:type" content="business.business">
	<meta property="og:title" content="Kaldi | Great coffee with a conscience">
	<meta property="og:url" content="/">
	<meta property="og:image" content="/img/og-image.jpg">
	<script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
</head>
```

CSSを読み込んでるところは以下の行だけみたいですね。

```
<link rel="stylesheet" href="/css/main.css">
```

ローカルリポジトリを確認します。
ファイルの場所は以下です。
