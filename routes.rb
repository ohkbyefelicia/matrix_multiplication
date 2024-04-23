Rails.application.routes.draw do
  root 'matrix#index'
  post '/multiply_matrices', to: 'matrix#multiply_matrices'
end
