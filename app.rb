require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/vehicles_controller')
require_relative('controllers/customers_controller')
require_relative('controllers/rentals_controller')

get '/' do
  erb( :index )
end
