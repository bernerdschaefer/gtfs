require 'pathname'
require Pathname(__FILE__).expand_path.dirname + 'datamapper'

class Trip
  include DataMapper::Resource
  include DataMapper::Types::GTFS

  property :id, Integer, :key => true, :field => 'trip_id'
  property :service_id, Integer
  property :trip_headsign, String
  property :direction, Direction, :field => 'direction_id'
  property :block_id, Integer

  belongs_to :route
  belongs_to :service, :class_name => 'Calendar', :child_key => [:service_id]
  has n, :stop_times
end