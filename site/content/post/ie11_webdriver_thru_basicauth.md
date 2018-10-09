---
title: IE11 webdriver on Win7 32bit で Basic認証付きのサイトにアクセスする
date: '2018-10-08T15:18:57+09:00'
description: >-
  こんにちは。batapy88です。IE11のwebdriverを、Windows7(32bit)で動かして、さらにBasic認証付きのサイトにアクセスする方法を探っていきます。
---
まずは、Selenium webdriverを動かすためのソースコードを例示します。

## Pythonソースコード

```
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC

（～ 中略 ～）

driver = webdriver.Ie()

driver.get("http://username:pasword@example.co.jp/basic_outh/html/")

driver.close()
```

## webdriver入手先

```
https://docs.seleniumhq.org/download/
```

上記の中程にある以下文章の「32 bit Windows IE」をクリックする

```
Download version 3.14.0 for (recommended) 32 bit Windows IE or 64 bit Windows IE
```
* 64bit環境でもwebdriverは32bitを使うことにします。64bitはめちゃくちゃ速度が遅いと他の記事にも書いてありますが、試しに64bitマシン上で64bitのWebdriverを動かしてみたところ、本当に遅くてすぐ使うのをやめました。

## webdriverのファイル名
```
IEDriverServer.exe
```
* InternetExplorerDriver.exeに変更せよとの記事もあるようですが、ダウンロードしたままで良いみたいです。変更してみたところ動かなくなりましたので。

## webdriver配置場所
pythonファイル（IE11.py）と同じフォルダ内に入れておきます。
* PATHを通すようにとの記事もありますが、同じフォルダ内なら `driver = webdriver.Ie()` で参照できます。

## IEのインターネットオプション
セキュリティタブを開き、すべてのタブの「保護モードを有効にする」にチェックマークを入れます

## Win7 32bitのレジストリキー変更
レジストリの変更は自己責任でお願いします。
レジストリエディタの起動は、コマンドプロンプトを起動し、regedit.exe と入力して起動できます。
```
HKEY_LOCAL_MACHINE/SOFTWARE/Microsoft/Internet Explorer/MAIN/FeatureControl/FEATURE_HTTP_USERNAME_PASSWORD_DISABLE
```
上記項目に DWORD iexplore.exe を新規追加し、値を0にします。
* 64bit環境では、レジストリのパスが異なります。以下のように途中にWow6432Nodeが追加されています。

Wow6432NodeはSOFTWAREツリーの最下部にあります。

```
HKEY_LOCAL_MACHINE/SOFTWARE/Wow6432Node/Microsoft/Internet Explorer/MAIN/FeatureControl/FEATURE_HTTP_USERNAME_PASSWORD_DISABLE
```

