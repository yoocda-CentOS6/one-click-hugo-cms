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

    ![image2018-10-12_17-34-24.png](/img/image2018-10-12_17-34-24.png)

4. 以下のようになっているか確認してから「Next >」をクリックする

    ![image2018-10-12_17-38-16.png](/img/image2018-10-12_17-38-16.png)

5. 自分がいつも使っているエディターが一覧にあれば選択してから「Next >」をクリックする

    ![image2018-10-12_17-40-7.png](/img/image2018-10-12_17-40-7.png)

    自分がいつも使っているエディターが一覧に無い場合は、「Nano」か「Atom」を選ぶのがおすすめ。

6. 「Use Git form the Windows Command Prompt」が選択されているか確認してから「Next >」をクリックする

     ![image2018-10-12_17-41-44.png](/img/image2018-10-12_17-41-44.png)

7. 「Use the OpenSSL library」が選択されているか確認してから「Next >」をクリックする

     ![image2018-10-12_17-46-40.png](/img/image2018-10-12_17-46-40.png)

8. 「Checkout Windows-style, commit Unix-style line endings」が選択されているか確認してから「Next >」をクリックする

     ![image2018-10-12_17-48-45.png](/img/image2018-10-12_17-48-45.png)

9. 「Use Window's default console window」が選択されているか確認してから「Next >」をクリックする

     ![image2018-10-12_17-55-12.png](/img/image2018-10-12_17-55-12.png)

10. 以下のようになっているか確認してから「Next >」をクリックする

     ![image2018-10-12_17-56-28.png](/img/image2018-10-12_17-56-28.png)

11. 何もせずにそのまま「Install」をクリックする

     ![image2018-10-12_17-57-30.png](/img/image2018-10-12_17-57-30.png)

     インストールが始まります。

     ![image2018-10-12_17-59-25.png](/img/image2018-10-12_17-59-25.png)

12. インストール完了画面が表示されたら、すべてチェックを外して「Finish」をクリックする

     ![image2018-10-12_18-0-20.png](/img/image2018-10-12_18-0-20.png)

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

   ![image2018-10-12_18-7-47.png](/img/image2018-10-12_18-7-47.png)

3.  以下のコマンドをコピペしてEnterを押す

    ```
    ssh -V
    ```

    以下のように表示されればOKです。

    ```
    OpenSSH_for_Windows_X.XxX, LibreSSL X.X.X
    ```

    ![image2018-10-12_18-14-2.png](/img/image2018-10-12_18-14-2.png)

これでGitのインストールは完了です。
