class BillboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @billboards = Billboard.all.sort_by(&:score)
  end
end
