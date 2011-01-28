require 'rubygems'
require 'httparty'
require 'ruby-debug'

module Backtype
  BASE_URL = "http://api.backtype.com/"
  DEFAULT_FORMAT = "json"

  class Base
    def initialize(params = {})
      @api_key = params[:api_key]
      raise NotAPIKeyGiven unless @api_key
    end

    def comments_search(params = {})
      raise_no_params params
      make_request "comments/search",  params
    end

    def connect(params = {})
      raise_no_params params
    end

    def post_comments(params = {})
      raise_no_params params
    end

    def post_stats(params = {})
      raise_no_params params
    end

    def tweetcount(params = {})
      raise_no_params params
    end

    def user_influencer_score(params = {})
      raise_no_params params
    end

    def user_top_sites(params = {})
      raise_no_params params
    end

    def user_influenced_by(params = {})
      raise_no_params params
    end

    def user_influencer_of(params = {})
      raise_no_params params
    end

    private

    def raise_no_params(params)
      raise NotParametersGiven if params.empty?
    end

    def make_request(service, params)
      format = params.delete(:format) || DEFAULT_FORMAT
      uri    = "#{BASE_URL}#{service}.#{format}"
      q      = params.merge({:key => @api_key })
      request = HTTParty::Request.new(Net::HTTP::Get, uri, :query => q)
      response = request.perform
      response.parsed_response
    end
  end
end
