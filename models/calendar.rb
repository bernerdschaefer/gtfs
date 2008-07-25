require 'pathname'
require Pathname(__FILE__).expand_path.dirname + 'datamapper'

class Calendar
  include DataMapper::Resource
  include DataMapper::Types::GTFS

  def self.storage_name(repository_name); 'calendar' end

  property :id,         Integer, :key => true, :field => 'service_id'
  property :monday,     Boolean
  property :tuesday,    Boolean
  property :wednesday,  Boolean
  property :thursday,   Boolean
  property :friday,     Boolean
  property :saturday,   Boolean
  property :sunday,     Boolean
  property :start_date, Date
  property :end_date,   Date

  has n, :trips, :child_key => [:service_id]
end