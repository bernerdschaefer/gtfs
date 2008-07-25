require 'rubygems'

gem "dm-core"
gem "do_sqlite3"

require 'dm-core'
require 'do_sqlite3'

ROOT = Pathname(__FILE__).dirname.parent.expand_path

DataMapper.setup(:default, "sqlite3://#{ROOT + '/data/dart.db'}")

module DataMapper
  module Types
    module GTFS
      class Boolean < DataMapper::Type(String)
        def self.load(value, property)
          value == "1"
        end
      end
      class Date < DataMapper::Type(String)
        def self.load(value, property)
          ::Date.civil(value[0, 4].to_i, value[4, 2].to_i, value[6, 2].to_i)
        end
      end
      class Direction < DataMapper::Type(Integer)
        def self.load(value, property)
          value == "0" ? :outbound : :inbound
        end
      end
      class Time < DataMapper::Type(String)
        def self.load(value, property)
          value.match(/(\d+)\:(\d+)\:(\d+)/)
          ::Time.local(*([$3, $2, $1] + ::Time.now.to_a[3..-1]))
        end
        def self.dump(value, property)
          value.to_a[0, 3].reverse.join(":")
        end
      end
    end
  end
end

Dir["#{ROOT}/models/*"].each { |file| require file }

def log(&block)
  DataObjects::Sqlite3.logger = DataObjects::Logger.new(STDOUT, 0)
  time = Time.now
  yield
  print "="*30, "[ TIME ]", "="*30, "\n"
  puts Time.now - time
  puts "="*68
  DataObjects::Sqlite3.logger = nil
end