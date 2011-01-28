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
      check_params params, [:q]
      make_request "comments/search",  params
    end

    def comments_by_author_url(params = {})
      check_params params, [:url]
      make_request "url/#{params[:url]}/comments",  params
    end

    def connect(params = {})
      check_params params, [:url]
      make_request "connect",  params
    end

    def connect_stats(params = {})
      check_params params, [:url]
      make_request "comments/connect/stats", params
    end

    def comments_by_page(params = {})
      check_params params, [:url]
      make_request "post/comments",  params
    end

    def comments_stats_by_page(params = {})
      check_params params, [:url]
      make_request "post/stats",  params
    end

    def stats_by_url(params = {})
      check_params params, [:q]
      make_request "tweetcount", params
    end

    def user_influencer_score(params = {})
      check_params params, [:user_name]
      make_request "user/influencer_score", params
    end

    def user_top_sites(params = {})
      check_params params, [:user_name]
      make_request "user/top_sites", params
    end

    def user_influenced_by(params = {})
      check_params params, [:user_name]
      make_request "user/influenced_by", params
    end

    def  user_influencer_of(params = {})
      check_params params, [:user_name]
      make_request "user/influencer_of", params
    end

    private
    def check_params (params = {}, required_keys = [])
      required_keys.each do |key|
        message = "You must specified :#{key} in the parameters"
        raise MissingParameters.new(message) unless params.has_key?(key)
      end
    end

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
