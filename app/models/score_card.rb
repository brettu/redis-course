class ScoreCard < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :contest_id
  belongs_to :user
  belongs_to :contest
end
