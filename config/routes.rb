Rails.application.routes.draw do
  get 'interviews/index'
 
  root to: "interviews#index"

  get "interviews/question" => "interviews#question"
  get "interviews/start" => "interviews#start"
  get "interviews/finish" => "interviews#finish"

end
