require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/rentals.rb')
also_reload( '../models/*' )

# INDEX - Get all Rentals
get'/rentals' do
  @rentals = Rental.all()
  erb(:"rentals/index")
end
# NEW-- Get form to create a new rentals

get '/rentals/:id/new' do
    @customers = Customer.all
    @vehicles = Vehicle.all
  erb(:"rentals/new")
end
 #SHOW-- Get one rental

get '/rentals/:id' do
  @rental = Rental.find(params[:id].to_i)
  erb(:"rentals/show")
end

# CREATE -- Save new rental to database

post '/rentals' do
  @rental = Rental.new(params)
  @rental.save()
  redirect '/rentals'
end
