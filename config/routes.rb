Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }

  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'


    resources :customers, only: [:index, :show, :edit, :update]
    resources :items
    resources :genres


  end


  scope module: :public do
    root 'homes#top'

    get 'homes/about' => 'homes#about' ,as: 'about'
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'


    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'

    #get 'customer/item' => 'items#index'
    #get 'customer/item' => 'items#show'
    resources :items, only: [:index, :show]

    #順番注意
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only: [:create, :index, :update, :destroy]

    resources :addresses, only: [:edit, :index, :create, :update, :destroy]

  end

end
