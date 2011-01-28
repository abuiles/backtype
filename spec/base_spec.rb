require 'spec_helper'

describe Backtype::Base do
  API_METHODS = [:comments_search, :comments_by_author_url, :connect, :connect_stats, :post_comments,
                 :post_stats, :tweetcount, :user_influencer_score,
                 :user_top_sites, :user_influenced_by, :user_influencer_of]

  API_METHODS.each do |method|
    it "should define #{method}" do
      Backtype::Base.public_method_defined?(method).should be(true)
    end

    it "should raise the NotParametersGiven exception if not parameters are given" do
      lambda{ Backtype::Base.new(:api_key => '123').send(method)}.should
      raise_error(Backtype::NotParametersGiven, "You must pass the required parameters")
    end
  end

  describe "public methods" do
    before(:each) do
      key = "98456ddaa49832s99907"
      @backtype = Backtype::Base.new(:api_key => key)
      @backtype.stub!(:make_request).and_return(true)
    end

    describe "namespace Comments" do
      before(:each) do
        @q   = "brainfuck AND esoteric"
        @url = "http://reddit.com"
      end

      describe "#comments_by_author_url" do
        it "should call /url/url/comments with the given params" do
          @backtype.should_receive(:make_request).with("url/#{@url}/comments", :url => @url)
          @backtype.comments_by_author_url :url => @url
        end
      end

      describe "#comments_search" do
        it "should call the comments/search with the given params" do
          @backtype.should_receive(:make_request).with("comments/search", :q => @q)
          @backtype.comments_search :q => @q
        end
      end

      describe "#connect" do
        it "should call connect with the given params" do
          @backtype.should_receive(:make_request).with("connect", :url => @url)
          @backtype.connect :url => @url
        end
      end

      describe "#post_comments" do
        it "should call post/comments with the given params" do
          @backtype.should_receive(:make_request).with("post/comments", :url => @url)
          @backtype.post_comments :url => @url
        end
      end

      describe "#post_stats" do
        it "should call post/starts with the given params" do
          @backtype.should_receive(:make_request).with("post/comments", :url => @url)
          @backtype.post_comments :url => @url
        end
      end
    end
    describe 'namespece Tweets' do
      describe "tweetcount" do
        it "should call tweetcount with the given params" do
          q = "http://reddit.com"
          @backtype.should_receive(:make_request).with("tweetcount", :q => q)
          @backtype.tweetcount :q => q
        end
      end
    end

    describe "Users" do
      before(:each) do
        @user_name = "abuiles"
      end

      describe "user_influencer_score" do
        it "should call user/influencer_score with the given params" do
          @backtype.should_receive(:make_request).with("user/influencer_score", :user_name => @user_name)
          @backtype.user_influencer_score :user_name => @user_name
        end
      end

      describe "user_top_sites" do
        it "should call user/top_sites with the given params" do
          @backtype.should_receive(:make_request).with("user/top_sites", :user_name => @user_name)
          @backtype.user_top_sites :user_name => @user_name
        end
      end

      describe "user_influenced_by" do
        it "should call user/influenced_by with the given params" do
          @backtype.should_receive(:make_request).with("user/influenced_by", :user_name => @user_name)
          @backtype.user_influenced_by :user_name => @user_name
        end
      end

      describe "user_influencer_of" do
        it "should call user/influencer_of with the given params" do
          @backtype.should_receive(:make_request).with("user/influencer_of", :user_name => @user_name)
          @backtype.user_influencer_of :user_name => @user_name
        end
      end
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
