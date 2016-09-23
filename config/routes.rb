Rails.application.routes.draw do
    get '/main' => 'users#main'
    post '/register' => 'users#create'
    post '/login' => 'users#login'
    get '/users' => 'users#index'
    get '/users/:id' => 'users#show'
    get '/logout' => 'users#logout'
    get '/professional_profile' => 'users#profile'

    get '/invite/:id' => 'users#invite'
    get '/delete_invitation/:id' => 'users#delete_invitation'

    get '/add_friend/:id/:invite_id' => 'users#add_friend'

end
