Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/question', to: 'question#list', as: 'list_questions'
  get '/question/submit', to: 'question#submit', as: 'submit_question'
  post '/question/submit', to: 'question#submit'
  get '/question/:id', to: 'question#view', as: 'view_question'
  get '/question/:id/answer', to: 'question#answer', as: 'answer_question'
  post '/question/:id/answer', to: 'question#answer'
  post '/vote/cast', to: 'vote#cast'
end
