require 'json'
require 'open-uri'
class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    answer = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{answer}"
    letter_checking = URI.open(url).read
    words = JSON.parse(letter_checking)

    if words["found"]
      @response = "Congrats! #{answer.upcase} is a valid English word!"
    else
      @response = "Sorry but #{answer.upcase} does not seem to be an English word..."
    end
  end
end
