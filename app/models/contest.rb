class Contest < ActiveRecord::Base

  has_many :score_cards
  has_many :users, through: :score_cards

  def self.current
    where(day: Date.today.yday).first
  end

  def seed_points!
    animals = Animal.fetch
    users.each do |user|
      user.vote(id, animals.sample["value"])
    end
  end

  def register_users!
    User.all.each do |user|
      ScoreCard.create(user: user, contest: self, score: 0)
    end
  end

  def score_board
    $redis.zrevrangebyscore("contest:#{id}", "+inf", "-inf", with_scores: true)
  end

  def leaderboard
    $redis.zrevrange("contest:#{id}", 0, 10).map{|id| User.find(id)}
  end


  def leaderboard_with_scores
    $redis.zrevrangebyscore("contest:#{id}", "+inf", "(1",
      with_scores: true,
      limit: [0,10]
    )
  end

  def user_score(user)
    $redis.zscore("contest:#{id}", user.id)
  end

  def user_rank(user)
    $redis.zrank("contest:#{id}", user.id)
  end

  def archive_results
    # Next step
    # Use the contest $redis score cards to write to SQL
    # remove the contest redis keys from memory
  end
end
