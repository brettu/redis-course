class User < ActiveRecord::Base
  has_many :score_cards

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
