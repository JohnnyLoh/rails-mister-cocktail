Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "controller#action"

  resources :cocktails, except: [ :update, :edit] do
    resources :doses, only: [:new, :create, :destroy, :index]
  end

  # resources :doses do
  #   resources :doses_tag, only: [:destory]
  # end

end
