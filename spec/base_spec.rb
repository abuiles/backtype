require 'spec_helper'

describe Backtype::Base do
  API_METHODS = [:comments_search, :connect, :post_comments,
                 :post_stats, :tweetcount, :user_influencer_score,
                 :user_top_sites, :user_influenced_by, :user_influencer_of]

  describe "public method" do

    API_METHODS.each do |method|
      it "should define #{method}" do
        Backtype::Base.public_method_defined?(method).should be(true)
      end
    end
  end
end
