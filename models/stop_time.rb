require 'pathname'
require Pathname(__FILE__).expand_path.dirname + 'datamapper'

class StopTime
  include DataMapper::Resource
  include DataMapper::Types::GTFS

  property :trip_id, Integer, :key => true
  property :stop_id, Integer, :key => true
  property :arrival_time, Time
  property :departure_time, Time
  property :stop_sequence, Integer
  property :stop_headsign, String
  property :pickup_type, Integer
  property :drop_off_type, Integer

  belongs_to :trip
  belongs_to :stop
end