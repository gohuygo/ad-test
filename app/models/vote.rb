class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :billboard

  enum direction: { up: 1, down: -1 }

  def direction_value
    Vote.directions[self.direction]
  end
end

