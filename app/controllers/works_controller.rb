class WorksController < ApplicationController

    include KokonaraWorksConcern
    include CwWorksConcern

    def index
        kokonara_url = 'https://coconala.com/requests?keyword=%E3%82%B9%E3%82%AF%E3%83%AC%E3%82%A4%E3%83%94%E3%83%B3%E3%82%B0&recruiting=true&page=1'
        cw_url = 'https://crowdworks.jp/public/jobs/search?keep_search_criteria=true&order=score&hide_expired=true&search%5Bkeywords%5D=%E3%82%B9%E3%82%AF%E3%83%AC%E3%82%A4%E3%83%94%E3%83%B3%E3%82%B0'
        kokonara_title = '.c-itemInfo_title a'
        kokonara_reward = '.c-itemTile_tile-budget'
        kokonara_rival = '.c-itemTile_tile-proposalCount'
        kokonara_limit = '.c-itemTile_tile-remainingDays'
        cw_title = '.item_title a'
        cw_reward = 'b.amount'
        set_kokonara_works(kokonara_url,kokonara_title,kokonara_reward,kokonara_rival,kokonara_limit)
        set_cw_works(cw_url,cw_title,cw_reward)
    end
end
