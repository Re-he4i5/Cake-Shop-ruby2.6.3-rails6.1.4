Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }

  devise_for :customer, controllers: {
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

    get 'customer/mypage' => 'customers#show', as: 'mypage'
    get 'customer/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customer/information' => 'customers#update', as: 'update_information'

    get 'customer/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customer/withdraw' => 'customers#withdraw', as: 'withdraw_customer'

    #get 'customer/item' => 'items#index'
    #get 'customer/item' => 'items#show'
    resources :items, only: [:index, :show]


  end

end
