require 'pathname'
require Pathname(__FILE__).expand_path.dirname + 'datamapper'

class Route
  include DataMapper::Resource

  def self.property(name, type, options = {}); super(name, type, { :field => "route_#{name}" }.merge(options)) end

  property :id, Integer, :key => true
  property :short_name, String
  property :long_name, String
  property :desc, String
  property :type, Integer
  property :url, String
  property :color, String
  property :text_color, String

  has n, :trips
end