Rails.application.routes.draw do

  root 'application#home'

  resources :keys
  resources :peers
  resources :psks

  resources :interfaces do
    resources :peers
  end

  get '/interfaces/:id/qr', to: 'interfaces#show_qr', as: 'show_qr'
  get '/interfaces/:id/show', to: 'interfaces#show_config', as: 'show_config'
  get '/interfaces/:id/file', to: 'interfaces#download_config', as: 'download_config'

  get '/network', to: 'graph#show', as: 'graph'
  get '/network2', to: 'graph#show2', as: 'graph2'
  get '/network/json', to: 'graph#json', as: 'graph_json'

  resources :hosts

  get '/hosts/:id/upload', to: 'hosts#upload', as: 'upload_wizard'
  patch '/hosts/:id/upload', to: 'hosts#upload'

  match '*path' => 'application#home', via: [:get, :post]

end
