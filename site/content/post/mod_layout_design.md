---
title: Netlify-CMSの構成を変える
date: '2018-10-09T22:28:29+09:00'
description: こんばんは、batapy88です。今日は、Netlify-CMSのページ構成を変える方法を探っていこうと思います。
---
## 書くところ多すぎ

Netlify-CMSを初期状態のまま使っていると、トップページから「Products」「Values」、
「Blog」、「Contact」の4ページを開くことができます。

トップページ一番上のナビゲーションからと、ページ本文の各ページへのリンクからです。

ただこれ、こんなに書くことがない人や、ブログだけやりたいひとなんかには、正直ツライ。

そこでバッサリ削ることにしたいと思います。

## 対象ファイルの所在

対象のファイルは以下2つです。

ナビゲーション用のhtml

```
one-click-hugo-cms\site\layouts\partials\nav.html
```

トップページ全体のhtml

```
one-click-hugo-cms\site\layouts\index.html
```

## コメントアウトする

nav.htmlの場合はこんな感じです。
```
<nav class="overflow-x-scroll overflow-x-visible-ns flex justify-between items-center center bg-white divider-grey relative">

	<!-- Logo -->
	<a href="/" class="pa3 db mr4 h-100 w3 flex-none">
		<img src="/img/logo.png" alt="batapy88.com logo" class="br0 db mb0 w-100"/>
	</a>

	<!-- Primary Nav -->
	<ul class="flex b grey-3">
	<!--<li><a href="/products" class="pa3 no-underline db">Products</a></li>

	<li><a href="/values" class="pa3 no-underline db">Values</a></li>

	 --><li><a href="/post" class="pa3 no-underline db">Blog</a></li>

	<!--<li><a href="/contact" class="pa3 no-underline db">Contact</a></li>-->
	</ul>

</nav>
```

index.htmlはこんな感じです。
```
{{ define "main" }}

{{ partial "jumbotron" (dict "imageUrl" .Params.image "title" .Title "subtitle" .Params.subtitle) }}
<!--
{{ partial "2-up" .Params }}

{{ partial "text-and-image" (dict "heading" .Params.values.heading "text" .Params.values.text "buttonText" "Read more" "buttonLink" "/values") }}
-->
{{ partial "blog" . }}

{{ end }}
```

コメントアウトする場所を変えれば、自分の好みに合わせたページ構成にできそうです。

また、今後もしページ構成を追加したいときも、コメントアウトを取るだけで戻せます。

GitHubを使っているので、コメントアウトではなく行削除でも良いのですが、こういう基幹系のソースコードはもとのコードがどうだったかを残しておきたくなるのは貧乏性でしょうか。。
