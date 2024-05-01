Rails.application.routes.draw do

  scope module: :public do
    root to: 'homes#top'
    resources :posts, only: [:new, :create, :update, :edit, :show, :index, :destroy]
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
