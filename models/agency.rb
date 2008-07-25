require 'pathname'
require Pathname(__FILE__).expand_path.dirname + 'datamapper'

class Agency
  include DataMapper::Resource

  def self.storage_name(repository_name); 'agency' end
  def self.property(name, type, options = {}); super(name, type, {:field => "agency_#{name}"}) end

  property :id, String, :key => true
  property :name, String
  property :url, String
  property :timezone, String
  property :lang, String
end