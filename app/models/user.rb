class User < ActiveRecord::Base

  has_many :score_cards
  has_many :contests, through: :score_cards

  def vote(contest_id, value)
    unless $redis.zadd("contest:#{contest_id}", value, id)
      $redis.zincrby("contest:#{contest_id}", value, id)
    end
  end

  def animals_spotted
    (1..5).each do |i|
      animal = Animal.top_10[i]
      $redis.setex("user_id:#{id}:viewed:#{animal}", (i * 10), animal)
    end
  end

  def recently_spotted_animals
    # Use 'scan' in production over 'keys'
    $redis.keys("*user_id:#{id}:viewed:*").map do |key|
      $redis.get(key)
    end
  end
end
