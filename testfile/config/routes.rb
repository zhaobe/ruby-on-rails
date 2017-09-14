#Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#end

CarrierWaveExample::Application.routes.draw do
   resources :resumes, only: [:index, :new, :create, :destroy]
   root "resumes#index"
end