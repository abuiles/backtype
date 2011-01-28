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

      it "should raise the NotParametersGiven exception if not parameters are given" do
        lambda{ Backtype::Base.new(:api_key => '123').send(method)}.should
        raise_error(Backtype::NotParametersGiven, "You must pass the required parameters")
      end
    end

    describe "comments_search" do
      before(:each) do
        key = "98456ddaa49832s99907"
        @backtype = Backtype::Base.new(:api_key => key)
      end
      use_vcr_cassette "backtype/comment_search", :record => :new_episodes

      it "should call the the comments_search API" do
        q = "brainfuck AND esoteric"
        response = @backtype.comments_search :q => "brainfuck AND esoteric"
        response["totalresults"].should == "9"
      end
    end

    describe "connect" do
      pending
    end

    describe "post_comments" do
      pending
    end

    describe "post_stats" do
      pending
    end

    describe "tweetcount" do
      pending
    end

    describe "user_influencer_score" do
      pending
    end

    describe "user_top_sites" do
      pending
    end

    describe "user_influenced_by" do
      pending
    end

    describe "user_influencer_of" do
      pending
    end
  end

  describe 'exceptions' do
    it "should raise the NotAPIKeyGiven exception if the API key is not given" do
      lambda{ Backtype::Base.new}.should raise_error(Backtype::NotAPIKeyGiven, "You must pass an api_key as parameter")
    end

    it "should not raise the NotAPIKeyGiven error if the API key is given" do
      lambda{ Backtype::Base.new :api_key => '123456' }.should_not raise_error(Backtype::NotAPIKeyGiven, "You must pass an api_key as parameter")
    end
  end
end
