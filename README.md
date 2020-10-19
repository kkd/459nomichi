# README

## 概要

本リポジトリは四国自然歩道（四国のみち、環境省ルート）のルートをGPXとして提供しようとするプロジェクトです。

http://www.env.go.jp/nature/nats/shizenhodo/sikoku/

発起人が愛媛県から始めています。皆さんのコントリビューション歓迎します。

## 四国のみちについて

環境省と国土交通省がそれぞれ定義している自然歩道です。ルートが若干異なります。

本プロジェクトは[環境省ルート](http://www.env.go.jp/nature/nats/shizenhodo/sikoku/)をベースにします。

## 各県のルートについて

以下のサイトから情報が入手できる。

* 徳島県
  * Webは製作中だが、県庁でルートマップを配布中らしい
* [高知県](http://www.pref.kochi.lg.jp/soshiki/030701/michi.html)
* [愛媛県](http://www.pref.ehime.jp/h15800/e-shizen_k/shikoku/index.html)
* [香川県](http://www.pref.kagawa.jp/kankyo/shizen/you-fo/you-fo/index.html)

## ルートデータについて

各県が提供している四国のみちコースマップを元に、ツールを使ってコースをプロットし、GPXとして出力します。

Google Mapでは山道が表示されないため、四国のみちのプロットは困難です。国土地理院の提供する地図サービス、あるいは国土地理院から承諾を受けて地図を使えるツールによってプロットすることが必要になります。

また、各県が提供している地図を参考にしても、四国のみちのルートが制定された後で、現地の状況が変化しているため、必ずしも現状の地図と一致するとは限りません。（国土地理院の地図がすでに四国のみちで使われている当時の地図と異なることはよくあります。）

筆者が走ったコースは、現地の状況に合わせて適時修正していく予定です。こういった最新状況への反映は個人で行うには手間も時間もかかるため、多数のコントリビューションを歓迎します。

## ルートデータ作成について

筆者はMacOSX上の[Trail Note](http://trail-note.com)を使用しています。国土地理院の地図サービスではKMLないしはGeo JSONでの出力のみサポートしています。KMLデータはGPXデータに変換してから登録することとします。
Windowsユーザーであれば、カシミール3Dが高機能かつ定番だと思います。

* [TrailNote](http://trail-note.com)
* [カシミール3D](http://www.kashmir3d.com/)
* [電子国土マップ](http://maps.gsi.go.jp/)

GPXとKMLの変換は[GPX2KML](http://gpx2kml.com)を使うと実現できます。

また、[GPSBabel](http://www.gpsbabel.org/)を使うとGPX<->KMLの相互変換ができますが、GPSBabelの出力するKMLはGoogle Mapにインポートする際に不都合があるため、オススメできません。単純なKML->GPXの目的なら使えるかもしれません。

## なぜKMLではなくGPXなの？

表現能力としてはKMLが圧倒的に高いのですが、表記に自由度が高く統一することが難しいと判断したためです。また筆者はKMLについては初学者のため方針を作ることが難しいということもあります。

GPXはWaypointとTrackのシンプルなデータ構成にしています。Routeについては現行は含めていません。

## コントリビュートの仕方

現行は、リポジトリをforkして頂き、Pull Requestを送ってください。（用語がわからない方は別途ご連絡ください）



