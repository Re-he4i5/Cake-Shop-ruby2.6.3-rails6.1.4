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

  end


  scope module: :public do
    root 'homes#top'

    get 'customer/mypage' => 'customers#show', as: 'mypage'

  end

end
