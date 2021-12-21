Rails.application.routes.draw do
  root 'LaboratiryWorks#index'
   get '/LaboratiryWorks/new', to: 'LaboratiryWorks#new', as:'new_lab'
   get '/LaboratiryWorks/:id', to: 'LaboratiryWorks#show', as: 'lab'
   post '/LaboratiryWorks', to: 'LaboratiryWorks#create'
   get '/LaboratiryWorks/:id/edit' ,to: 'LaboratiryWorks#edit' , as: 'edit_lab'
   put '/LaboratiryWorks/:id' , to: 'LaboratiryWorks#update'
   patch '/LaboratiryWorks/:id' , to: 'LaboratiryWorks#update'
   delete '/LaboratiryWorks/:id', to: 'LaboratiryWorks#destroy'
  get '/LaboratiryWorks/:id/mark', to: 'LaboratiryWorks#mark', as: 'mark_lab'
  post '/LaboratiryWorks/:id/mark' , to: 'LaboratiryWorks#grade'
  # resources :labs
end
