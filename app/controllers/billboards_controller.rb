class BillboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @billboards = Billboard.all.sort_by(&:score)
  end

  def update
    puts "HELLO! BILLBOARDS#UPDATE"
    render :json => {'hello': 'world'}
  end
end
