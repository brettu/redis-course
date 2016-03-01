class Animal < ActiveRecord::Base
  def self.rank_animals!
    Animal.all.each do |animal|
      $redis.zadd("animals", animal.value, animal.name)
    end
  end

  def self.top_10
    $redis.zrevrange("animals", 0, 9)
  end
end
