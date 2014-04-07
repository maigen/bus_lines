BusTimetable::Application.routes.draw do
  get "lines/index"
  resources :lines, :only => [:index]
  # resources :stations
end
