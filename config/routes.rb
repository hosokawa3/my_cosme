Rails.application.routes.draw do

  scope module: :public do
    root to: 'homes#top'
    get 'users/profile/:id' => 'users#show', as: 'profile'
    get 'users/information/edit/:id' => 'users#edit', as: 'edit_information'
    patch 'users/information/:id' => 'users#update', as: 'update_information'
    resources :posts, only: [:new, :create, :update, :edit, :show, :index, :destroy]
    # resources :users, only: [:show, :edit, :update]
  end
  #会員側
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

   #管理者側
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
