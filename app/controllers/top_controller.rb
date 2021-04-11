class TopController < ApplicationController
  require "open-uri"
    def index
      api = Rails.env['NEWS_API_KEY']
      uri = "https://newsapi.org/v2/everything?q=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9&sortBy=popularity&apiKey=#{ENV['NEWS_API_KEY']}"
      article_serialized = open(uri).read
      @articles = JSON.parse(article_serialized)
    end
end