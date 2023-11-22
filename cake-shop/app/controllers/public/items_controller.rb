class Public::ItemsController < ApplicationController

    def index
        @genres = Genre.all
        if params[:id]
            @items = Item.where(genre_id: params[:id] , is_active: "true")
          else
            @items = Item.where(is_active: "true" )
        end
    end

    def show
        @item = Item.find(params[:id])
        @cart_item = CartItem.new
    end


end
