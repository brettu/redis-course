class User < ActiveRecord::Base
  has_many :score_cards
end
