class Admin::ItemsController < ApplicationController
    def index
        @items = Item.all

    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.save 
            redirect_to admin_item_path(@item)
        else
            render :new
        end
    end

    def show
        @item = Item.find(params[:id])
    end

    def edit
    end

    def update
        @item = Item.find(item_params[:id])
        if @item.update(item_params)
            redirect_to admin_item_path(@item.id)
        else
            render :edit
        end
    end

    def search
        @items = Item.search(params[:search_word])
        @search_word = params[:search_word]
        render "index"
    end

    private

    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_active)
    end

end
