# require 'data_mapper'# This class corresponds to a table in the database

class Link

  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :url, String
end
