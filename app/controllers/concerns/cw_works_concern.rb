module CwWorksConcern
    require 'open-uri'
    # Nokogiriライブラリの読み込み
    require 'nokogiri'

    def set_cw_works
    # スクレイピング先のURL
        url = 'https://crowdworks.jp/public/jobs/search?keep_search_criteria=true&order=score&hide_expired=true&search%5Bkeywords%5D=%E3%82%B9%E3%82%AF%E3%83%AC%E3%82%A4%E3%83%94%E3%83%B3%E3%82%B0'

        charset = nil  
        html = open(url) do |f|
        charset = f.charset # 文字種別を取得
        f.read # htmlを読み込んで変数htmlに渡す
        end

        # htmlをパース(解析)してオブジェクトを生成
        doc = Nokogiri::HTML.parse(html, nil, charset)

        @work = []
        @reward = []

        doc.css('.item_title a').each do |link|
            @work << link.text 
        end

        doc.css('b.amount').each do |link|
            @reward << link.text.gsub(" ", "") 
        end


        #puts @work
        #puts @reward
        end
    
end