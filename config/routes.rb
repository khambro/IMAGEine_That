Rails.application.routes.draw do

  get "/", to: "users#index", as: :root



  get "/user/new", to: "users#new", as: :new_user
  post "/new-user", to: "users#create"
  get "/user/account/:id", to: "users#show"
  # get "/user/account/:id", to: "users#edit"
  post "/user/edit/:id", to: "users#update", as: :edit_user
  post "/user/account/:id", to: "users#edit"
  get "/user/:id/photos", to: "users#user_collection"


  get "/sign-out", to: "sessions#sign_out", as: :sign_out
  post "/sign-in", to: "sessions#sign_in", as: :sign_in
  get "/sign-in", to: "sessions#sign_in"

  get "/new-photo", to: "photos#new", as: :new_photo
  post "/new-photo", to: "photos#create"
  get "/user/photos", to: "photos#show"
  post "/photos/subscribe", to: "photos#send_subscribe", as: :send_subscribe
  get "/photos/all", to: "photos#sorted"

  get "/user-homepage", to: "photos#show", as: :photos
  post "/user-homepage", to: "photos#create"


  get "/browse", to: "photos#all"
  post "/review", to: "reviews#create"
  post "/review/received", to: "photos#review_received", as: :review_received
  get "/photo/:id", to: "reviews#show"
  delete "/photo/:id", to: "photos#delete"







  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
