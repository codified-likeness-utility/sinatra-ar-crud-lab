
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  # READ ---------------------------------------------------
  get '/articles' do 
    @articles = Article.all 
    erb :index
  end
  # CREATE -----------------------------------------------
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end
  # READ ----------------------------------------------------
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  # # UPDATE --------------------------------------------------
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    erb :show
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy

    redirect "/articles"
  end
  

end
