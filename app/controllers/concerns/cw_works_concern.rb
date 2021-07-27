module CwWorksConcern

    require 'open-uri'
    require 'nokogiri'

    def set_cw_works(url,titleCss,rewardCss)
    
      charset = nil
      html = open(url) do |f|
        charset = f.charset # 文字種別を取得
        f.read # htmlを読み込んで変数htmlに渡す
      end
    
      # htmlをパース(解析)してオブジェクトを生成
      doc = Nokogiri::HTML.parse(html, nil, charset)
    
      title = []
      url = []
      reward = []
    
      doc.css(titleCss).each do |link|
        title << link.text.gsub(" ", "") 
        url << link[:href]
      end
    
      doc.css(rewardCss).each do |link|
        reward << link.text.gsub(" ", "") 
      end
      
      @cw = {
        title: title,
        url: url,
        reward: reward
      }
    end
      
    end