class Vote < ActiveRecord::Base
  validates_uniqueness_of :billboard, scope: :user


  belongs_to :user
  belongs_to :billboard

  enum direction: { up: 1, down: -1 }

  def direction_value
    Vote.directions[self.direction]
  end
end

