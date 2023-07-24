class Public::HomesController < ApplicationController
    def top
        @items = Item.where(is_active: "true" ).limit(4)
    end

    def about
    end

end
