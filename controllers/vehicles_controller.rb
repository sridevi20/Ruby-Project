require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/vehicles.rb')
also_reload( '../models/*' )


# INDEX - Get all vehicles

get '/vehicles' do
  @vehicles = Vehicle.all()
  erb (:"vehicles/index")
end

#NEW - Get form to create a  new vehicle

get '/vehicles/:id/new' do

  erb(:"vehicles/new")
end

#SHOW - Get one vehicle

get '/vehicles/:id' do
  id = params[:id]
  @vehicle = Vehicle.find(id)
  erb(:"vehicles/show")
end

#CREATE - Save new vehicle to database

post '/vehicles' do
  @vehicles = Vehicle.new(params)
  @vehicles.save()
  redirect '/vehicles'
end
# EDIT - edit specify id to database

get '/vehicles/:id/edit' do
  @vehicle = Vehicle.find(params[:id])
  erb(:"vehicles/edit")
end

post '/vehicles/:id' do
  id = params[:id]
  @vehicle = Vehicle.new(params)
  @vehicle.update()
  redirect '/vehicles'
end
# #DELETE - Vehicle from database
get '/vehicles/:id' do
 @vehicle = Vehicle.find(params[:id])
  erb(:"vehicle/delete")
end
post '/vehicles/:id/delete' do
  id = params[:id]
   @vehicle = Vehicle.find(id)
   @vehicle.delete()
  redirect '/vehicles'
end
