feeds = [{:a=>1,:b=>7},{:b=>2}]

commentings = feeds.map {|feed|  {:b=>feed[:b]} }

p commentings

#commentings = feeds.map {|feed|  {'commenting_id': feed.refer_id, 'commenting_type': feed.refer_type} }.compact