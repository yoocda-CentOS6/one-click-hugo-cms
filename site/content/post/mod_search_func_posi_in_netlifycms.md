---
title: Netlify-CMSに追加した検索機能の位置を調整する
date: '2019-01-09T22:56:05+09:00'
description: こんにちは、batapy88です。2019年が始まりました。今年初めは前回追加した検索機能の位置を調整してみたので、そのときのメモです。
---
## まずは位置を移動する

[前回の記事](https://batapy88.com/post/add_seach_func_to_netlify-cms/)で、検索ボックスをとりあえずナビゲーションバーの下に追加してみましたが、レイアウト調整を後回しにしていました。

まずは位置を変えることから始めます。

``` /site/layout/_default/baseof.html ```

baseof.htmlに追記したタグを切り取ります。

```
<html lang="en">
  {{ partial "head" . }}
  <body class="sans-serif">
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe ~ 省略 ~ ></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    {{ partial "nav" . }}
    <div id="srchBox"> <!-- ここから切り取り -->
    ～ 省略 ～
    </div> <!-- 切り取りここまで -->
  </body>
</html>
```

次に、移動先のhtmlを開きます。ナビゲーション（nav.html）に移動することにしました。

``` /site/layout/_default/nav.html ```

切り取ったタグを貼り付ける場所はnav要素配下のul要素内です。

デフォルトでは以下のような感じになっていると思います。

```
	<!-- Primary Nav -->
	<ul class="flex b grey-3">
	    <li><a href="/products" class="pa3 no-underline db">Products</a></li>

		<li><a href="/values" class="pa3 no-underline db">Values</a></li>

	    <li><a href="/post" class="pa3 no-underline db">Posts</a></li>

	    <li><a href="/contact" class="pa3 no-underline db">Contact</a></li>
	</ul>
```

こちらの複数あるli要素の並びの中で、好きな位置を選べばOKです。

私は一番左に表示したいので、先頭に貼り付けました。

```
	<!-- Primary Nav -->
	<ul class="flex b grey-3">
		<!-- #srchBox -->
		<div id="srchBox" class="watermark">
			<form action="https://custom.search.yahoo.co.jp/search" method="get" id="srch" target="hhooggee">
                <p id="srchForm">
                    （中略）
                </p>
			</form>
			<img src="https://custom.search.yahoo.co.jp/images/window/省略.gif">
		</div>
		<script type="text/javascript">
			(function () {
                （中略）
			})();
		</script>
		<!-- /#srchBox -->
	    <li><a href="/products" class="pa3 no-underline db">Products</a></li>

		<li><a href="/values" class="pa3 no-underline db">Values</a></li>

	    <li><a href="/post" class="pa3 no-underline db">Posts</a></li>

	    <li><a href="/contact" class="pa3 no-underline db">Contact</a></li>
	</ul>
```

## CSSで見栄えを調整する

nav.htmlに検索ボックスのタグを移動したときに、もともとインラインで書かれていたcssの内容を、個人設定用のcssに転記しました。

インラインのまま書いておいてもよいのですが、扱いやすくなるかなと思ったからです。

で、ちょこちょこと調整したところ、こんな感じになりました。

![searchbar01.png](/img/searchbar01.png)

![searchbar02.png](/img/searchbar02.png)

まだまだ:hover時の見た目や、検索文字を入力したときの見た目に調整の余地がありそうです。

それはまた次回！！
