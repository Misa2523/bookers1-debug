Rails.application.routes.draw do
  #ルートパスでトップ画面を指定
  root to: "homes#top"
  resources :books
end
