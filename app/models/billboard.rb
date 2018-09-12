class Billboard < ActiveRecord::Base
  has_many :votes

  def self.ordered_by_votes

  end
end
