Rails.application.routes.draw do

  root 'application#home'

  resources :keys
  resources :peers
  resources :psks

  resources :interfaces do
    resources :peers
  end

  get '/interfaces/:id/qr', to: 'interfaces#generate_qrcode', as: 'show_qr'
  get '/interfaces/:id/file', to: 'interfaces#download_config_file', as: 'download_config'
  get '/interfaces/:id/show', to: 'interfaces#show_config_file', as: 'show_config'

  resources :hosts

  get '/hosts/:id/upload', to: 'hosts#upload', as: 'upload_wizard'
  patch '/hosts/:id/upload', to: 'hosts#upload'

end
