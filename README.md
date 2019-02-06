# README


* Api for reservation of restaurant tables

* Endpoints

* POST /users |  <br /> params => user[name] <br />
                        user[password] <br />
                        user[password_confirmation] <br />
                        user[email] <br />

* POST /sign_in |  <br /> params => auth[email]  <br />
                          auth[password]

* PUT /users/:id |  <br /> params => user[name]  <br />
                            user[password]  <br />
                            user[password_confirmation]  <br />
                            user[email]  <br />
                 header => Authorization  <br />

* POST /restaurants |  <br /> params => restaurant[name]  <br />
                              restaurant[email]  <br />
                              restaurant[phone_number]  <br />

* POST /restaurants/add_shift |  <br /> params => restaurant[name]  <br />
                                        restaurant[start_time] <br />
                                        restaurant[end_time] <br />
                              header => RestToken  <br />

* POST /restaurants/add_table | <br /> params => restaurant[name] <br />
                                        restaurant[min_guest] <br />
                                        restaurant[max_guest] <br />
                              header => RestToken <br />

* GET /restaurants/reservations | header => RestToken

* POST /reservations | <br /> params => reservation[start_at] <br />
                               reservation[end_at] <br />
                               reservation[guest_count] <br />
                               reservation[table_id] <br />
                               reservation[shift_id] <br />
                      header => Authorization <br />

* PUT /reservations/:id | <br /> params => reservation[start_at] <br />
                               reservation[end_at] <br />
                               reservation[guest_count] <br />
                               reservation[table_id] <br />
                               reservation[shift_id] <br />
                      header => Authorization <br />
