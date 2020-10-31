Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :users, only:[:show, :edit, :update] do
  	  get '/unsubscribe' => "users#unsubscribe" #退会確認画面表示
      patch '/withdraw' => "users#withdraw"		#ユーザー情報を退会済みに変更
    resource :follows, only:[:create, :destroy]
  	  get "followed" =>  'follows#followed'
  	  get "follower" => 'follows#follower'
    resources :plants, only:[:index]
  end
  resources :plants, only:[:new, :create, :show, :edit, :update, :destroy] do
  	resources :trees, only:[:create, :edit, :update, :destroy]
  	resources :comments, only:[:create, :destroy]
  	resource :like, only:[:create, :destroy]
  end
  resources :tag, only:[:index]
  resources :categories, only:[:index]
  resources :tags, only:[:index]
  get '/help' => "trees#help"
end
