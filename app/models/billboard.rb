class Billboard < ActiveRecord::Base
  has_many :votes

  def self.ordered_by_votes

  end

  def score
    # return 0 if no votes
     #upvotes - downvotes
  end
end
