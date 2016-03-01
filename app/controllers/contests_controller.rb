class ContestsController < ApplicationController
  def show
    @contest = Contest.includes(:score_card).where(id: params[:id])
  end

  def vote
    Contest.add_vote(params)  
  end

  def leaderboard


  end
end
