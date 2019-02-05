# README


* Api for reservation of restaurant tables *

* Endpoints *

POST /users | params => user[name]
                        user[password]
                        user[password_confirmation]
                        user[email]

POST /sign_in | params => auth[email]
                          auth[password]

PUT /users/:id | params => user[name]
                            user[password]
                            user[password_confirmation]
                            user[email]
                 header => Authorization

POST /restaurants | params => restaurant[name]
                              restaurant[email]
                              restaurant[phone_number]

POST /restaurants/add_shift | params => restaurant[name]
                                        restaurant[start_time]
                                        restaurant[end_time]
                              header => RestToken

POST /restaurants/add_table | params => restaurant[name]
                                        restaurant[min_guest]
                                        restaurant[max_guest]
                              header => RestToken

GET /restaurants/reservations | header => RestToken

POST /reservations | params => reservation[start_at]
                               reservation[end_at]
                               reservation[guest_count]
                               reservation[table_id]
                               reservation[shift_id]
                      header => Authorization

PUT /reservations/:id | params => reservation[start_at]
                               reservation[end_at]
                               reservation[guest_count]
                               reservation[table_id]
                               reservation[shift_id]
                      header => Authorization
