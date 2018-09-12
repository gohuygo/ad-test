class BillboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @billboards = Billboard.all.sort_by(&:score).reverse
  end

  def update
    billboard_id = params[:id]
    direction    = params[:direction]

    current_vote = current_user.votes.find_by_billboard_id(billboard_id)

    if current_vote.present?
      current_vote.update_attribute(:direction, direction)
    else
      current_user.votes.create(billboard_id: billboard_id, direction: direction)
    end

    billboard = Billboard.find(billboard_id)
    render :json => {billboard_id: billboard_id, score: billboard.score}
  end
end
