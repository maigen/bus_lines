BusTimetable::Application.routes.draw do
  resources :lines
  resources :stations
  resources :stops
end
