class BillboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @billboards = Billboard.all
    puts "HELLO!", current_user.inspect
  end
end
