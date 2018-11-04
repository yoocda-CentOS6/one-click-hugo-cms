---
title: Windows10にGitをインストールする
date: '2018-11-04T16:28:26+09:00'
description: こんにちは、batapy88です。今日はGitをWindows10にインストールする方法をメモしていきたいと思います。
---
Gitをインストールする

1. 以下のリンクをクリックする

   [https://git-scm.com/download/win](https://git-scm.com/download/win)

   クリックするとブラウザが起動して自動的にダウンロードが始まります。

2. ダウンロードされた「Git-X.X.X-XX-bit.exe」をダブルクリックする

   ユーザーアカウント制御画面が表示された場合は許可してください。

3.  インストール開始画面が表示されたら「Next >」をクリックする

4. 以下のようになっているか確認してから「Next >」をクリックする

5. 自分がいつも使っているエディターが一覧にあれば選択してから「Next >」をクリックする

   自分がいつも使っているエディターが一覧に無い場合は、「Nano」か「Atom」を選ぶのがおすすめ。

6. 「Use Git form the Windows Command Prompt」が選択されているか確認してから「Next >」をクリックする

7. 「Use the OpenSSL library」が選択されているか確認してから「Next >」をクリックする

8. 「Checkout Windows-style, commit Unix-style line endings」が選択されているか確認してから「Next >」をクリックする

9. 「Use Window's default console window」が選択されているか確認してから「Next >」をクリックする

10. 以下のようになっているか確認してから「Next >」をクリックする

11. 何もせずにそのまま「Install」をクリックする

    インストールが始まります。

12. インストール完了画面が表示されたら、すべてチェックを外して「Finish」をクリックする

    チェックを外し損ねて「Finish」をクリックすると黒画面かブラウザが起動します。落ち着いて何もせずそのまま閉じればOKです。

## インストール後の確認

1. コマンドプロンプトを起動する

2. 以下のコマンドをコピペしてEnterを押す

   ```
   git --version
   ```

   以下のように表示されればOKです。

   ```
   git version X.XX.X.Windows.X
   ```

3.  以下のコマンドをコピペしてEnterを押す

    ```
    ssh -V
    ```

    以下のように表示されればOKです。

    ```
    OpenSSH_for_Windows_X.XxX, LibreSSL X.X.X
    ```


これでGitのインストールは完了です。
