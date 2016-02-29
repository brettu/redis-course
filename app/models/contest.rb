class Contest < ActiveRecord::Base

  has_many :score_cards

  def register_users!
    User.all.each do |user|
      ScoreCard.create(user: user, contest: self, score: 0)
    end
  end
end
