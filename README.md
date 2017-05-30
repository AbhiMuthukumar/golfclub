1. clone the github repo.

2. run "bundle install" to get all the dependencies.

3. create a superuser called "golfclub" with password "golfclub" using the below command.

  createuser -P -s -e golfclub

  It will ask you for password and confirm the password. keep the passowrd same as username - "golfclub"

4. rake db:create - run this command to create the database.

5. rake db:migrate - run this command perform the db migrations.

6. rake db:seed - run this command to seed the data in "clubs" table.

7. rails server -  run this command to start the server

8. visit  "http://localhost:3000" to launch the application.

9. Go on registering with your own profile using Register feature or try using username - "Abhi" & password - "password" to login.

10. It will take you to the bookings page which shows your booking history.

11. Click on "Book Now" to make a new booking.  Fill in the details, check for availability and book the slot.

12.  Try deleting the slots you booked in the bookings page.

13.  Logoff the application using "Logout" option at the top!
