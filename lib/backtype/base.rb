require 'rubygems'
require 'httparty'

module Backtype
  BASE_URL = "http://api.backtype.com/"
  DEFAULT_FORMAT = "json"

  class Base
    def initialize(params = {})
      @api_key = params[:api_key]
      raise NotAPIKeyGiven unless @api_key
    end

    def comments_search(params = {})
      make_request "comments/search",  params
    end

    def comments_by_author_url(params = {})
      raise "Parameter url is necessary" unless params.has_key?(:url)
      make_request "url/#{params[:url]}/comments",  params
    end

    def connect(params = {})
      make_request "connect",  params
    end

    def connect_stats(params = {})
      make_request "comments/connect/stats", params
    end

    def post_comments(params = {})
      make_request "post/comments",  params
    end

    def post_stats(params = {})
      make_request "post/stats",  params
    end

    def tweetcount(params = {})
      make_request "tweetcount", params
    end

    def user_influencer_score(params = {})
      make_request "user/influencer_score", params
    end

    def user_top_sites(params = {})
      make_request "user/top_sites", params
    end

    def user_influenced_by(params = {})
      make_request "user/influenced_by", params
    end

    def  user_influencer_of(params = {})
      make_request "user/influencer_of", params
    end

    private

    def make_request(service, params)
      raise NotParametersGiven if params.empty?
      q        = params.merge({:key => @api_key })
      format   = params.delete(:format) || DEFAULT_FORMAT
      uri      = "#{BASE_URL}#{service}.#{format}"
      request  = HTTParty::Request.new(Net::HTTP::Get, uri, :query => q)
      response = request.perform
      response.parsed_response
    end
  end
end
