class Billboard < ActiveRecord::Base
  has_many :votes

  def score
    return 0 if votes.blank?
    @score ||= votes.map(&:direction_value).sum
  end
end
