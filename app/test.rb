require 'open-uri'
require 'nokogiri'

def set_work

    #doc = Nokogiri::HTML.parse(html, nil, charset)

    doc = Nokogiri::HTML(URI.open('https://www.lancers.jp/work/search?sort=client&open=1&show_description=1&work_rank%5B%5D=3&work_rank%5B%5D=2&work_rank%5B%5D=0&budget_from=&budget_to=&keyword=スクレイピング&not='))

    @works = []

    doc.css('c-media__title-inner').each do |link|
        @works << link.content
    end
    p @works
end