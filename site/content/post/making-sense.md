---
title: Netlify-CMSのCSSを上書きしてカスタマイズする
date: '2018-10-02T23:50:00+09:00'
description: Netrify-CMSのCSSを上書きして、思い通りにカスタマイズする方法を探っていきます。
image: /img/blog-flavor_wheel.jpg
---
こんばんは。batapy88です。

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

```
フォルダールート/src/css/main.css
```

main.cssを開くと以下の記述が。

```
/*! TACHYONS v4.5.5 | http://tachyons.io */

/*
 *
 *      ________            ______
 *      ___  __/_____ _________  /______  ______________________
 *      __  /  _  __ `/  ___/_  __ \_  / / /  __ \_  __ \_  ___/
 *      _  /   / /_/ // /__ _  / / /  /_/ // /_/ /  / / /(__  )
 *      /_/    \__,_/ \___/ /_/ /_/_\__, / \____//_/ /_//____/
 *                                 /____/
 *
 *    TABLE OF CONTENTS
 *
 *    1. External Library Includes
 *       - Reset.css | http://meyerweb.com/eric/tools/css/reset/
 *    2. Tachyons Modules
 *    3. Variables
 *       - Media Queries
 *       - Colors
 *    4. Debugging
 *       - Debug all
 *       - Debug children
 *
 */


/* External Library Includes */
@import './imports/_reset';

/* Modules */
@import './imports/_box-sizing';
@import './imports/_images';
@import './imports/_background-size';
@import './imports/_background-position';
@import './imports/_outlines';
@import './imports/_borders';
@import './imports/_border-radius';
@import './imports/_border-style';
@import './imports/_border-widths';
@import './imports/_border-colors';
@import './imports/_code';
@import './imports/_coordinates';
@import './imports/_clears';
@import './imports/_display';
@import './imports/_flexbox';
@import './imports/_floats';
@import './imports/_font-style';
@import './imports/_font-weight';
@import './imports/_forms';
@import './imports/_heights';
@import './imports/_line-height';
@import './imports/_links';
@import './imports/_lists';
@import './imports/_max-widths';
@import './imports/_widths';
@import './imports/_overflow';
@import './imports/_position';
@import './imports/_opacity';
@import './imports/_spacing';
@import './imports/_text-decoration';
@import './imports/_text-align';
@import './imports/_text-transform';
@import './imports/_type-scale';
@import './imports/_typography';
@import './imports/_utilities';
@import './imports/_visibility';
@import './imports/_white-space';
@import './imports/_vertical-align';
@import './imports/_states';
@import './imports/_z-index';
@import './imports/_styles';
@import './imports/_buttons';
@import './imports/_svg';
@import './imports/_cms';

/* Variables */
/* Importing here will allow you to override any variables in the modules */
@import './imports/_colors';
@import './imports/_media-queries';
@import './imports/_variables';

/* Debugging */
@import './imports/_debug-children';
@import './imports/_debug-grid';

/* Uncomment out the line below to help debug layout issues */
/*@import './imports/_debug';*/
```

このmain.cssの最終行に以下を記述して、上書き用のCSSを読み込んであげます。

```
@import './custom';
```

そして、main.cssと同階層にcustom.cssを追加します。

```
.bg-fix-primary :first-child {
    box-shadow: 0.5rem 0 0 #00ff00, -0.5rem 0 0 #00ff00;
}

.bg-primary {
    background-color: #00ff00;
}
```

たとえばこんなふうに書くと、

変更前はオレンジだった文字の背景を、

![before](../../static/img/before.png)

緑色に変えることができました。

![after](../../static/img/after.png)

これで自分の好きなデザインに変えていくことができそうです。
