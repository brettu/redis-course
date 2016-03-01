class HomeController < ApplicationController
  def index
    @contests = Contest.all
    @score_cards = ScoreCard.all
  end
end
