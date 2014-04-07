BusTimetable::Application.routes.draw do
  get "lines/index"
  resources :lines
  resources :stations
end
