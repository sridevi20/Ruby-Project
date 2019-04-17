 require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/customers.rb')
also_reload( '../models/*' )

#INDEX-- Get all the customers

get'/customers' do
  @customers = Customer.all()
  erb( :"customers/index" )
end
# NEW -- Get form to create a new customer

get '/customers/:id/new' do

  erb(:"customers/new")
end

#SHOW-- Get one vehicle

get '/customers/:id' do
  @customer = Customer.find(params[:id].to_i)
  erb(:"customers/show")
end
#CREATE-- Save new customer to database

post '/customers' do
  @customers = Customer.new(params)
  @customers.save()
  redirect '/customers'
end
#EDIT-- specifies id to the databse

get '/customers/:id/edit' do
  @customer = Customer.find(params[:id])
  erb(:"customers/edit")
end
#UPDATE--- update the customer to database
post '/customers/:id' do
  @customer = Customer.new(params[:id])
  @customer.update()
  redirect '/customers'
end
#DELETE---- delete existing customer from database

get '/customers/:id' do
  @customers = Customer.find(params[:id])
  erb(:"customers/delete")
end

post '/customers/:id/delete' do
  @customer = Customer.new(params)
  @customer.delete()
  redirect '/customers'
end
