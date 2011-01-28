module Backtype
  class Base
    def initialize(params = {})
      @api_key = params[:api_key]
      raise "You need to pass your API key" unless @api_key
    end

    def comments_search
    end
    def connect
    end
    def post_comments
    end
    def post_stats
    end
    def tweetcount
    end
    def user_influencer_score
    end
    def user_top_sites
    end
    def user_influenced_by
    end
    def user_influencer_of
    end
  end
end
