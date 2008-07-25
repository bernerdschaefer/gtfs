require 'pathname'
require Pathname(__FILE__).dirname.expand_path + 'models/datamapper.rb'

# trip = nil
# repository(:default) do
#   route = Route.first(:short_name => "360")
#   trip = route.trips(:service_id => 2).first
# end
# stop_times = nil
# log do
#   repository(:default) do
#     stop_times = Trip.get(trip.id).stop_times.entries
#   end
# end
# log do
#   stops = stop_times.map { |stop_time| stop_time.stop_id }
#   puts Stop.all(:id => stops).inspect
#   # puts StopTime.get(trip.id, stop_time.stop_id).stop.inspect
# end

stop = Stop.get(19350)
log do
  stop.stop_times(:arrival_time.gt => Time.now).entries
end