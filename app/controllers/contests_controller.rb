class ContestsController < ApplicationController

  def show
    @contest = Contest.current_contest
    @leaderboard = []
    @winner = []
  end

end
