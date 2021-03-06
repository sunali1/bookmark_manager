ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

    get '/links/new' do
      erb :'links/new'
    end

    post '/links' do
      link = Link.new(url: params[:url],
                      title: params[:title])
                      params[:tags].split.each do|tag|
      link.tags << Tag.first_or_create(name: tag)
    end
      link.save
      redirect to('/links')
    end

    get '/tags/:name' do
      tag = Tag.first(name: params[:name])
      p tag
      @links = tag ? tag.links : []
      p @links
      erb :'links/index'
    end
end
# Models, Views, and Controller have to be all at the same level
#the 'requires' have to be in the order the program follows; ie
