class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :votes

  def votes_hash
    @votes_hash ||= votes.each_with_object({}) { |v, h| h[v.billboard_id] = v.direction }
  end
end
