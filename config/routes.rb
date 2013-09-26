SurveyMonkey2::Application.routes.draw do
 
 resources :surveys
 root 'survey#index'

end
