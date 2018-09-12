class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :votes

  def upvoted_billboard?(billboard_id)
    vote_results[billboard_id].present? && vote_results[billboard_id] == "up"
  end

  def downvoted_billboard?(billboard_id)
    vote_results[billboard_id].present? && vote_results[billboard_id] == "down"
  end

  private

  def vote_results
    @vote_results ||= votes.each_with_object({}) { |v, h| h[v.billboard_id] = v.direction }
  end
end
