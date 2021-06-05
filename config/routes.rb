Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/elevation', to: 'elevation#index'
      get '/3-day-forecast', to: 'forecast#three_day'
      get '/1-day-forecast', to: 'forecast#one_day'
    end
  end
end
