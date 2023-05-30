Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'tasks', to: 'tasks#index'
  get 'tasks/new', to: 'tasks#new'
  # tengo que poner el new antes que el :id porque sino me toma el /new como un id
  post 'tasks', to: 'tasks#create'
  # no pongo un tasks/create porque no es necesario mostrar cómo se crea, pero
  # sí luego mandarlo por ejemplo a la vista de la task que acaba de crear (show)
  get 'tasks/:id/edit', to: 'tasks#edit', as: :task_edit
  patch 'tasks/:id', to: 'tasks#update'
  get 'tasks/:id', to: 'tasks#show', as: :task
  delete 'tasks/:id', to: 'tasks#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
end
