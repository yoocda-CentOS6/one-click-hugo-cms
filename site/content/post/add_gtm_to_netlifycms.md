---
title: Netlify-CMSにGoogle Tag Managerを仕込む
date: '2018-10-10T22:18:43+09:00'
description: こんばんは、batapy88です。今日はNetlify-CMSにGoogle Tag Managerを仕込んでみたいと思います。
---
## Google Analyticsタグと換装する

以前書いた記事「[Netlify-CMSにGoogle Analyticsタグを仕込む](https://batapy88.com/post/embed_google_analytics_tag/)」でGoogle Analyticsタグは導入済みでした。

それとは別に、Google Tag Managerってのがあるのは知ってたけど、正直何が違うのか、どう使うのかわかってなかった。

今回、この記事を書くにあたって実際に導入して、どう違うのか確認してみました。

## 既存のGoogle AnalyticsアカウントはそのままでOK

すでにGoogle Analyticsアカウントを持っていれば、そのアカウントはそのままでOKでした。

Google Tag Managerアカウントを新規作成して、コンテナと呼ばれる機能にタグを追加します。

そこにGoogle AnalyticsのトラッキングIDを入力すればOKでした。

ちょっと迷うけど、まあ難しくはない。

## Netlify-CMSに導入する

Google Tag Managerの新規タグ作成画面で生成される2つのコードを、head要素とbody要素にそれぞれ貼り付けていく必要があります。

まずはhead要素。以下のファイルが対象です。

```
site\layouts\partials\head.html
```

既に導入済みのGoogle Analyticsタグを削除し、同じ場所にGoogle Tag Managerのコード（上のタグ）を貼り付けます。

変更前

```
<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-XXXXXXX-1"></script>
```

変更後

```
<!-- Google Tag Manager -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-XXXXXXX');</script>
	<!-- End Google Tag Manager -->
```

これでOKです。

次に、body要素の開始タグのすぐ後ろにGoogle Tag Managerのコード（下のタグ）を貼り付けます。

対象のファイルは以下です。

```
site\layouts\_default\baseof.html
```

変更前

```
<!doctype html>
<html lang="en">
  {{ partial "head" . }}
  <body class="sans-serif">
    {{ partial "nav" . }}
    {{ block "main" . }}{{ end }} 
    {{ partial "footer" . }} 
  </body>
</html>
```

変更後

```
<!doctype html>
<html lang="en">
  {{ partial "head" . }}
  <body class="sans-serif">
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-XXXXXXX"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    {{ partial "nav" . }}
    {{ block "main" . }}{{ end }} 
    {{ partial "footer" . }} 
  </body>
</html>
```

これでOKです。

ローカルリポジトリで修正したファイルをGitHubにプッシュしてデプロイします。

デプロイが終わったのを確認したら、Google Tag Managerの管理画面に戻って、プレビューをクリックします。

そのあと、対象のサイトをブラウザで表示すると、ページの下のほうにGoogle Tag Managerの管理画面が表示されていると思います。

## まとめ

これで導入できました。

Google Tag Managerを使うと、サイト内のページにいろんなタグを簡単に仕込めるそうなので、今後うまく使っていきたいと思います。

