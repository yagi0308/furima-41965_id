class ItemsController < ApplicationController
  def index
    # @items = Item.all
  end

  def new
    @user = User.new
  end
end
