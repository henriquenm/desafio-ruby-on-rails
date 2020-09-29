Rails.application.routes.draw do

  resources :transactions do
    collection do
      get :new_import
      post :import
    end
  end
end
