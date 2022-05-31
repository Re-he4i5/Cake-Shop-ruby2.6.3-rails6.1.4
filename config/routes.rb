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


  end


  scope module: :public do
    root 'homes#top'

    get 'customer/mypage' => 'customers#show', as: 'mypage'

    get 'customer/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customer/information' => 'customers#update', as: 'update_information'

    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'


  end

end
