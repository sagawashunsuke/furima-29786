class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  # def index
  #   @items = Item.all
  # end

  # def new
  #   @item = Item.new
  # end

  # def move_to_index
  #   uncless user_signed_in?
  #     redirect_to action: :index
  # end
end
