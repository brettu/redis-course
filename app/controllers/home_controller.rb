class HomeController < ApplicationController
  def index
    @contest = Contest.all
  end
end
