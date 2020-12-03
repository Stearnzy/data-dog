class SearchController < ApplicationController
  def index
    number = params[:number]
    conn = Faraday.new("https://api.thedogapi.com") do |f|
      f.headers["x-api-key"] = ENV["DOG_API_KEY"]
    end

    response = conn.get("/v1/images/search") do |req|
      req.params[:limit] = number
    end

    @dogs = JSON.parse(response.body, symbolize_names: true)
  end
end
