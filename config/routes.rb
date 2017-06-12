Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  resources :users, except:[:index, :create, :new, :edit, :show, :update, :destroy] do
		resources :trucks
	end

  # Gmaps::Application.routes.draw do
  #   resources :users
  #   root 'users#index'
  # end
end

# notes => match each view to route.
# homepage => '/' users#index
# login/signup (partials) on homepage => '/' users#index
# after login => User(truck owner) => 'users/:user_id/trucks' redirected to trucks#index
# show one truck on trucks profile for one user => 'users/:user_id/trucks/:id' trucks#show

# routes
# new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#            user_password PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
#                          POST   /users/password(.:format)      devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#        user_registration PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
# #                          DELETE /users(.:format)               devise/registrations#destroy
# #                          POST   /users(.:format)               devise/registrations#create
# #                     root GET    /                              users#index
# #        new_user_session2 GET    /users/sign_in(.:format)       devise/sessions#new
# root GET    /                                         users#index
#              user_trucks GET    /users/:user_id/trucks(.:format)          trucks#index
#                          POST   /users/:user_id/trucks(.:format)          trucks#create
#           new_user_truck GET    /users/:user_id/trucks/new(.:format)      trucks#new
#          edit_user_truck GET    /users/:user_id/trucks/:id/edit(.:format) trucks#edit
#               user_truck GET    /users/:user_id/trucks/:id(.:format)      trucks#show
#                          PATCH  /users/:user_id/trucks/:id(.:format)      trucks#update
#                          PUT    /users/:user_id/trucks/:id(.:format)      trucks#update
#                          DELETE /users/:user_id/trucks/:id(.:format)      trucks#destroy
