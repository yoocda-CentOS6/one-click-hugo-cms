---
title: Netlify-CMSに検索機能を追加してみる
date: '2018-12-24T21:47:10+09:00'
description: >-
  こんばんは、batapy88です。今日はNetlify-CMSに検索機能を追加してみようと思います。今回はひとまず追加だけしてみます。レイアウト調整は後回し。
---
## 無料の検索機能を追加する

CMSとかに無料で検索機能を追加しようとすると、すぐに思い浮かぶのが「[Google カスタム検索](https://cse.google.co.jp/cse/)」です。

Googleの高度な検索機能を自分のサイトに導入できるのですがら、それはすごく魅力的。登録も簡単です。

ただ、今のところGoogleカスタム検索は、検索結果画面に広告が表示される仕様になっています。この広告は消せないんです。

これではちょっとかっこ悪い。

次に思い浮かぶのが、「[Yahoo カスタム検索](https://custom.search.yahoo.co.jp/)」でしょうか。

こちらも検索エンジンはGoggleですから、検索機能としては申し分ありません。

さらに、Yahooカスタム検索なら広告も表示されません。これはいい！

## Netlify-CMSに検索機能を設置する

あらかじめ、Yahoo検索で自分のサイトを検索対象にして、検索ボックスを作成しておきます。

次に、Netlify-CMSを開きます。

今回、私はナビゲーションバーの下に検索ボックスを設置することにしました。

ナビゲーションバーの下を調整するには以下のファイルを編集します。

``` /site/layout/_default/baseof.html ```

baseof.htmlの中身のオリジナルはこんな感じです。

```
<html lang="en">
  {{ partial "head" . }}
  <body class="sans-serif">
    {{ partial "nav" . }}
  </body>
</html>
```

私の場合、GoogleTagManagerを利用しているので、それ用のタグが入っています。

```
<html lang="en">
  {{ partial "head" . }}
  <body class="sans-serif">
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe ～ 省略 ～></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    {{ partial "nav" . }}
  </body>
</html>
```

nav要素の下に検索ボックスを入れたいので、タグの挿入位置は``` {{ partial "nav" . }} ``` の次行になります。

```
<html lang="en">
  {{ partial "head" . }}
  <body class="sans-serif">
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe ~ 省略 ~ ></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    {{ partial "nav" . }}
    <div id="srchBox">
    ～ 省略 ～
    </div>
  </body>
</html>
```

この状態で保存してビルドすると、nav要素の下に検索ボックスを設置することができました。

## まとめ

設置がカンタンで高機能の検索ボックスを利用できるのはとてもありがたいですね。これからもガンガン利用していきたいと思います。