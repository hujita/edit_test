#coding: utf-8

Mybbs::Application.routes.draw do
  root to: "messages#index"
  get "show" => "messages#show"
  post "post" => "messages#post"
  get "destroy" => "messages#destroy"
  get "test" => "messages#test"
end
