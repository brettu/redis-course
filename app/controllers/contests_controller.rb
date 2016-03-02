class ContestsController < ApplicationController

  def show
    @contest = Contest.current
    @leaderboard = []
    @winner = []
  end

end
