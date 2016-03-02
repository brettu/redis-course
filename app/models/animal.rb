class Animal < ActiveRecord::Base

  class << self
    def create_lookup_table!
      Animal.all.map do |animal|
        $redis.sadd("animal_set", {name: animal.name, value: animal.value}.to_json)
      end
    end
    
    def fetch
      $redis.smembers("animal_set").map do |record|
        JSON.parse(record)
      end
    end

    def rank_animals!
      Animal.all.each do |animal|
        $redis.zadd("animals", animal.value, animal.name)
      end
    end

    def top_10
      $redis.zrevrange("animals", 0, 9)
    end
  end

end
