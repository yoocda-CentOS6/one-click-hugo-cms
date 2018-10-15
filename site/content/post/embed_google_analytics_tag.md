---
title: Netlify-CMSにGoogle Analyticsタグを仕込む
date: '2018-10-03T23:20:10+09:00'
description: こんばんは、batapy88です。今日はNetlify-CMSにGoogle Analyticsタグを仕込む方法を探っていきます。
image: ''
---
## Google Anlytics導入したい

Netlify-CMSで立ち上げたサイトにGoogle Analyticsタグを仕込んでアクセス解析したいです。

さてどのファイルにGoogle Analyticsタグを設置すればよいのか。

そもそも設置できるのか？？いや、できるはず。

ローカルリポジトリのファイル群を漁ってみると…、ありましたありました。

## head要素生成用ファイルにタグを追記する

ファイルの所在は以下です。

```
/layout/partial/head.html
```

head.htmlの変更前の中身は以下。

```
<head>

	<title>{{ .Title }} | Kaldi</title>
	<link rel="stylesheet" href="/css/main.css" />

	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,700" rel="stylesheet">

	<!-- Favicons -->
	<link rel="apple-touch-icon" sizes="180x180" href="/img/apple-touch-icon.png">
	<link rel="icon" type="image/png" href="/img/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="/img/favicon-16x16.png" sizes="16x16">
	<link rel="manifest" href="/manifest.json">
	<link rel="mask-icon" href="/img/safari-pinned-tab.svg" color="#ff4400">
	<meta name="theme-color" content="#fff">

	<!-- Open Graph -->
	<meta property="og:type" content="business.business">
	<meta property="og:title" content="Kaldi | Great coffee with a conscience">
	<meta property="og:url" content="/">
	<meta property="og:image" content="/img/og-image.jpg">

	<script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
</head>
```

上記の`</head>`の直前にGoogle AnalyticsタグをそのままペーストすればOK。

```
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-xxxxxxxxx-x"></script>
	<script>
	window.dataLayer = window.dataLayer || [];
	function gtag(){dataLayer.push(arguments);}
	gtag('js', new Date());

	gtag('config', 'UA-xxxxxxxxx-x');
	</script>
```

ペーストが終わったら、ローカルリポジトリで以下コマンドを実行してNetlifyにデプロイする。

```
git fetch
git pull
git add . -A
git commit -m "Google Analyticsタグを追加しました。"
git push
```

## 確認

ページを更新した後、デベロッパーツールでheadタグの最後にGoogle Analyticsタグが挿入されていることを確認します。

ちゃんと追加されてる。

Google Analyticsの管理画面に行くとアクティブユーザーに「1名」が表示されている。

成功！

よーし、これでアクセス解析やるぞー！

