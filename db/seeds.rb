require_relative("../models/customers.rb")
require_relative("../models/vehicles.rb")
require_relative("../models/rentals.rb")
require("pry-byebug")

vehicle1 = Vehicle.new({

                "make"  => "Audi",
                 "model" => "Q7",
                  "colour" => "white",
                   "seat_capacity" => 5,
                     "fuel_type" => "petrol",
                      "daily_price" => 75,
                      "available_stock" => 20
                 })

  vehicle1.save()

vehicle2 = Vehicle.new({

                "make"  => "Audi",
                 "model" => "Q5",
                  "colour" => "black",
                  "seat_capacity" => 7,
                    "fuel_type" => "petrol",
                      "daily_price" => 100,
                      "available_stock" => 40
                })

    vehicle2.save()

vehicle3 = Vehicle.new({

                "make"  => "BMW",
                "model" => "3series",
                "colour" => "blue",
                "seat_capacity" => 5,
                 "fuel_type" => "petrol",
                 "daily_price" => 110,
                 "available_stock" => 80
              })

      vehicle3.save()

vehicle4 = Vehicle.new({

              "make"  => "Honda",
               "model" => "CR-V",
                "colour" => "white",
                 "seat_capacity" => 7,
                  "fuel_type" => "petrol",
                  "daily_price" => 160,
                  "available_stock" => 50
                })

        vehicle4.save()

vehicle5 = Vehicle.new({

                 "make"  => "Honda",
                  "model" => "Civic",
                   "colour" => "black",
                   "seat_capacity" => 7,
                    "fuel_type" => "petrol",
                    "daily_price" => 150,
                    "available_stock" => 60
                })

          vehicle5.save()

vehicle6 = Vehicle.new({

                "make"  => "Mercedes Benz",
                  "model" => "c_class",
                  "colour" => "blue",
                  "seat_capacity" => 5,
                    "fuel_type" => "petrol",
                    "daily_price" => 120,
                    "available_stock" => 50
            })

            vehicle6.save()

vehicle7 = Vehicle.new({

             "make"  => "Toyota",
               "model" => "verso",
               "colour" => "black",
               "seat_capacity" => 7,
                 "fuel_type" => "petrol",
                 "daily_price" => 100,
                 "available_stock" => 90
              })

              vehicle7.save()

vehicle8 = Vehicle.new({

                "make"  => "Vauxhall",
                  "model" => "Mokka_X",
                  "colour" => "blue",
                  "seat_capacity" => 5,
                    "fuel_type" => "diesel",
                    "daily_price" => 80,
                    "available_stock" => 40
                })

                vehicle8.save()

  vehicle9 = Vehicle.new({

                 "make"  => "Skoda",
                   "model" => "Octavia",
                   "colour" => "blue",
                    "seat_capacity" => 5,
                    "fuel_type" => "diesel",
                    "daily_price" => 75,
                    "available_stock" => 30
                  })

                  vehicle9.save()

customer1 = Customer.new({

                        "first_name" => "Lisa",
                         "last_name" => "Carroll",
                          "country"  => "Scotland",
                          "city"    => "Glasgow",
                          "age"       => 25

                    })

                    customer1.save()

customer2 = Customer.new({

                           "first_name" => "Kathleen",
                            "last_name" => "Murray",
                            "country"  => "Scotland",
                            "city"    => "Glasgow",
                            "age"       => 30
                      })

                      customer2.save()

customer3 = Customer.new({

                          "first_name" => "Abby",
                           "last_name" => "Feeney",
                           "country"  => "Scotland",
                           "city"    => "Edinburgh",
                             "age"      => 22
                        })
                        customer3.save()

customer4 = Customer.new({

                          "first_name" => "Kirsty",
                           "last_name" => "Smith",
                           "country"  => "Scotland",
                           "city"    => "Aberdeen",
                           "age"       => 35
                          })
                          customer4.save()

customer5 = Customer.new({
                           "first_name" => "Natalie",
                            "last_name" => "Rennie",
                            "country"  => "Scotland",
                            "city"    => "Dundee",
                            "age"      => 27
                            })
                            customer5.save()

customer6 = Customer.new({
                           "first_name" => "Claire",
                             "last_name" => "Bear",
                              "country"  => "Scotland",
                              "city"    => "Inverness",
                              "age"      => 32
                              })
                              customer6.save()

customer7 = Customer.new({
                           "first_name" => "Lesleyanne",
                            "last_name" => "Sweeney",
                              "country"  => "Scotland",
                                "city"    => "Glasgow",
                                  "age"   =>    23

                                })

                                customer7.save()

rental1 = Rental.new({

                            "customer_id" => customer1.id,
                              "vehicle_id"  => vehicle1.id

                            })

                              rental1.save()

rental2 = Rental.new({

                            "customer_id" => customer2.id,
                              "vehicle_id"  => vehicle2.id

                                })

                                rental2.save()

rental3 = Rental.new({

                            "customer_id" => customer3.id,
                              "vehicle_id" => vehicle3.id

                                })

                                rental3.save()

rental4 = Rental.new({

                              "customer_id" => customer4.id,
                                 "vehicle_id"  => vehicle4.id

                                  })

                                  rental4.save()








  binding.pry
  nil
