# URLにアクセスするためのライブラリの読み込み
module KokonaraWorksConcern

require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'

def set_kokonara_works
# スクレイピング先のURL
  url = 'https://coconala.com/requests?keyword=%E3%82%B9%E3%82%AF%E3%83%AC%E3%82%A4%E3%83%94%E3%83%B3%E3%82%B0&recruiting=true&page=1'

  charset = nil
  html = open(url) do |f|
    charset = f.charset # 文字種別を取得
    f.read # htmlを読み込んで変数htmlに渡す
  end

  # htmlをパース(解析)してオブジェクトを生成
  doc = Nokogiri::HTML.parse(html, nil, charset)

  @work = []
  @reward = []

  doc.css('.c-itemInfo_title a').each do |link|
    @work << link.text.gsub(" ", "") 
  end

  doc.css('.c-itemTileLine').each do |link|
    @reward << link.text.gsub(" ", "") 
  end



  # タイトルを表示
  puts @work
  puts @reward
end



set_kokonara_works
  
end