Rails.application.routes.draw do
  root 'homepage#index'

  # Add routes below this line
  get 'tasks' => 'tasks#index'
  # Add routes below above line

  post 'tasks' => 'tasks#create'

  delete 'tasks/:id' => 'tasks#destroy'

  put '/tasks/:id/mark_complete' => 'tasks#mark_complete'

  put '/tasks/:id/mark_active'   => 'tasks#mark_active'

  # Redirect all other paths to index page, which will be taken over by AngularJS
  get '*path' => 'homepage#index'
end
