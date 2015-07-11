======================
README
======================

# 概要

本リポジトリは四国自然歩道（四国のみち）のルートをGPXとして提供しようとするプロジェクトです。

http://www.env.go.jp/nature/nats/shizenhodo/sikoku/

発起人が愛媛から始めています。皆さんのコントリビューション歓迎します。

# 四国のみちについて

環境省と国土交通省がそれぞれ定義している自然歩道です。ルートが若干異なります。

本プロジェクトは[環境省ルート](http://www.env.go.jp/nature/nats/shizenhodo/sikoku/)をベースにします。

# 各県のルートについて

以下のサイトから情報が入手できる。

* 徳島県
  * Webは製作中だが、県庁でルートマップを配布中らしい
* [高知県](http://www.pref.kochi.lg.jp/soshiki/030701/michi.html)
* [愛媛県](http://www.pref.ehime.jp/h15800/e-shizen_k/shikoku/index.html)
* [香川県](http://www.pref.kagawa.jp/kankyo/shizen/you-fo/you-fo/index.html)

# ルートについて

各県が提供している四国のみちコースマップを元に、ツールを使ってコースをプロットし、GPXとして出力します。

Google Mapでは山道が表示されないため、プロットはほぼ不可能です。国土地理院の提供する地図サービス、あるいは国土地理院から承諾を受けて地図を使えるツールによってプロットするのがやりやすいです。

筆者はMacOSX上の[Trail Note](http://trail-note.com)を使用しています。国土地理院の地図サービスではKMLないしはGeo JSONでの出力のみサポートしています。KMLデータはGPXデータに変換してから登録することとします。

* [電子国土マップ](http://maps.gsi.go.jp/)
    - KML
* [TrailNote](http://trail-note.com)
    - GPX

GPXとKMLの変換は[GPX2KML](http://gpx2kml.com)を使うと実現できます。

また、[GPSBabel](http://www.gpsbabel.org/)を使うとGPX<->KMLの相互変換ができます（その他の多種フォーマット間の変換が可能）


