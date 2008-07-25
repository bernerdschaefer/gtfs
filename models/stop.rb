require 'pathname'
require Pathname(__FILE__).expand_path.dirname + 'datamapper'

class Stop
  include DataMapper::Resource

  def self.property(name, type, options = {}); super(name, type, { :field => "stop_#{name}" }.merge(options)) end

  property :id, Integer, :key => true
  property :name, String
  property :desc, String
  property :lat, Float
  property :lon, Float
  property :zone_id, Integer, :field => 'zone_id'
  property :url, String

  has n, :stop_times
end