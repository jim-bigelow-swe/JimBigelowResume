JimBigelowResume::Application.routes.draw do

  get "home/index"

  root :to => 'home#index'

  match  "/resume" => "resume#stream_as_pdf"

end
