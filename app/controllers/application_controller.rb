
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  #  redirect '/articles/:id'
  end

  post '/articles' do
    @article=Article.create(params)
    # binding.pry
   redirect "/articles/#{@article.id}"

  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @articles = Article.find(params["id"])
    erb :show
  end
# binding.pry
  get '/articles/:id/edit' do
   @articles = Article.find(params["id"])
   erb :edit
 end

 patch '/articles/:id' do
   id = params["id"]
   new_params = {}
   old_post = Article.find(id)
   new_params[:title] = params["title"]
   new_params[:content] = params["content"]
   old_post.update(new_params)

   redirect "/articles/#{id}"
 end

 delete '/articles/:id/delete' do
   @articles = Article.find(params["id"])
   @articles.destroy
   erb :delete
 end
end
