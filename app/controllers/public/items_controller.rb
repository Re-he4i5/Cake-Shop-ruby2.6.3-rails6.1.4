class Public::ItemsController < ApplicationController

    def index
        @genres = Genre.all
        if params[:id]
            @items = Item.where(genre_id: params[:id])
          else
            @items = Item.all
        end
    end

    def show
        @item = Item.find(params[:id])
        @cart_item = CartItem.new
    end


end
