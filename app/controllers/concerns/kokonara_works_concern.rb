module KokonaraWorksConcern

require 'open-uri'
require 'nokogiri'

def set_kokonara_works(url,titleCss,rewardCss,rivalCss,limitCss)

  charset = nil
  html = open(url) do |f|
    charset = f.charset # 文字種別を取得
    f.read # htmlを読み込んで変数htmlに渡す
  end

  # htmlをパース(解析)してオブジェクトを生成
  doc = Nokogiri::HTML.parse(html, nil, charset)

  title = []
  reward = []
  rival =[]
  limit = []
  url = []

  doc.css(titleCss).each do |link|
    title << link.text.gsub(" ", "") 
    url << link[:href]
  end

  doc.css(rewardCss).each do |link|
    reward << link.text.gsub(" ", "") 
  end

  doc.css(rivalCss).each do |link|
    rival << link.text.gsub(" ", "") 
  end

  doc.css(limitCss).each do |link|
    limit << link.text.gsub(" ", "") 
  end

  @kokonara = {
    title: title,
    url: url,
    reward: reward,
    rival: rival,
    limit: limit
  }
end
end