
# Beaver Shelter

**Demo:**


![shelterdemo](https://user-images.githubusercontent.com/18538465/88754049-8b01f800-d112-11ea-9eb3-29546e729c99.gif)


## Introduction 
Our team - BeaverShelter has built a responsive web app to find the perfect match for pet lovers and a home for our furry friends. We developed our web application with Rails, using the Bootstrap frontend framework to easily design layouts that look great on desktop and mobile. It was a slow start for the team as we ramped up on our knowledge of Ruby/Rails but once the ball started rolling we found the work engaging. Our website is essentially a standard CRUD web application: shelters can register, create animal profiles and status updates, and update those animal profiles. Adopters can register and browse animal profiles and status updates. Ultimately we are proud to present our website http://www.beavershelter.team. 

## User Perspective 
### Setup & Usage Instructions 
The application is fully Dockerized and should work on Mac/Linux/Windows.

#### With Docker (Recommended)
Ensure Docker is running on your system. Allocate at least 0.5 to 1 GB of memory in the settings. Allocating more CPU cores will also greatly speed up build times.
Clone the repository/zipped files to your machine and open a terminal session in the project directory.
Run docker-compose build and grab a cup of tea, the web container will take awhile to complete.
Run docker-compose up 
This will start up the main web container serving the application as well as other dependencies such as the database and a Redis server.
Open a new terminal window and run docker-compose run web rake db:migrate 
This will initialize the database used by the application
Once this has completed, run docker-compose run web rake db:seed to create an admin user 
The website should now be accessible at http://localhost:3000 and the admin interface should be accessible at http://localhost:3000/admin/login 
Admin username: admin@example.com Password: password 
#### Without Docker 
Ensure that you have Ruby (v~ 2.5.8), Rails (v~ 5.2.4), and Postgres installed on your system. A local Postgres server should also be running. Note that the project is configured with a default username/password for Postgres, see `config/database.yml`
Run bundle install and then rake db:migrate in the project root folder 
Run bundle exec rails s -p 3000 -b '0.0.0.0' to start the server

If you’d rather skip the setup and go straight to the website, you can do so by navigating your browser to http://www.beavershelter.team/. Animal profiles and status updates are publicly viewable. The admin interface is located at /admin 

To create a new shelter account, you can fill out the form at /sign_up. Note that you will need to provide a valid email address to verify your account. To create an adopter account, the same holds true /users/sign_up 

## Web App Functionalities 


### Global Pages

- Main landing page:
	When users go to our website, this will be the starting page. Here users will see recent adoption status updates on the animals within our database. Once an animal is adopted, the shelter can create a status update to indicate that the animal has been adopted. Once this is done, the landing page will update to reflect those changes and show which animals have been adopted with their pictures and name. 

![image](https://user-images.githubusercontent.com/18538465/88728581-ee763080-d0e6-11ea-8f2d-064f4efa2eb2.png)

- About: 
This is the page where we introduce our mission statement and how we are connected to our sheltered pets.

- Browse Animals:
	Users will be presented with all the animals within the database from all the shelters. Each animal card will show minimal information about the animal for a cleaner presentation. If the user wishes, the “show” option on the card can be selected which will redirect users to a page that only shows that animal and more information associated with that specific animal. On the “show” page, images of the animal will be presented in a carousel which will automatically cycle through the animal’s images. User can also press on directional arrows to cycle through images (if more than one was attached with the animal). Additionally, there is a search option users can use to organize how the animals are presented and to search for a specific animal (More search function details with graphical example 1).

- Browse Status Updates:
	Once a shelter enters a status update for an animal, these updates will be presented in this section of the webapp.  On this page, users will see which animal from which shelter was updated and a comment for each animal describing the update with a timestamp of when the status was updated. 

- Shelter and Adopter Login and Signup:
	Based on the user, he/she can sign up then login as a shelter or adopter. Both users will sign up with an email of their choice and a password that must be at least 6 characters long.The adopter user can enter the user’s name, number, email, and email notification preference. The shelter user will be allowed to enter the shelter's name, address, number, and its logo image. If the user has any sign up issues (forgot password, did not receive confirmation email, or forgot unlock instructions), then the user can select based on the problem and will be allowed to enter their email to re-receive instructions. All emails such as any resent for problems or the initial confirmation email will come from “admin@beavershelter.com” which will contain relevant information based on what the user chose. Based on if the user logged in as a shelter or adopter, the user will be presented with different options (explained more below). 

- Email Notifications:
	While there is no specific page dedicated to this, when an adopter user signs up, the user has a choice of opting into email notifications. If this option was originally not chosen, the user can edit their profile to include the notifications. If this option is chosen, that specific adopter user will receive an email from “admin@beavershelter.com” containing status updates from the past week. 

![image](https://user-images.githubusercontent.com/18538465/88728802-5cbaf300-d0e7-11ea-82d2-13dd8996d035.png)


- Logged in Pages

#### As a shelter:

	In addition to all the globally accessible pages, shelter users will be allowed to edit their shelter profiles, add/edit animal status updates, and add/edit animal profiles. 

The Create Animal Profile will become available which allows the user to enter any relevant animal information he/she wishes (includes name, image, type/breed, weight, height, color, disposition, and availability). If an image is not included, a default beaver head picture will take the image’s place in the Animal Profiles view page. 

The Create Status Update tab will become available which allows the user to pick from a dropdown list of all the animals that were entered from their shelter login and enter updates about that animal. 

_Shelters will only be able to edit status updates that were created using the same shelter login. Similarity shelter users will see “edit” and “destroy” options on the animal cards that were created with that shelter login credentials on the Browse Animal section._


![image](https://user-images.githubusercontent.com/18538465/88728626-03eb5a80-d0e7-11ea-8d24-6ebe73da2081.png)



####  As an adopter: In addition to all globally accessible pages, adopter users will be able to edit their profiles.

![image](https://user-images.githubusercontent.com/18538465/88728641-08177800-d0e7-11ea-94b8-d1c841fa5f2b.png)


### Graphical Example 1 - Usage of animal search function

By default a hidden option but once the “Click for Advanced Search” is clicked, users will be presented with a search that covers all of the pets attributes. Users can search based on fields of their choice and results will return based on their selections. Incorrect casing and partial searches will also be processed with no error. Referencing the example screenshot, if an user typed in “gar” into the Animal Name field, then the webapp will return the pet named “Garfield” with no issues. Additionally, different fields can be combined for a more accurate result. Again referencing the screenshot, if the user searches for both “gar” within the Animal Name field and “dog” in the Animal Type field, the user will be presented with no results because there is no dog within the database with a name that starts with “gar.” Lastly, the links on the bottom of the search field (animal type, weight, height) can be clicked to organize the view of animals based on the selection. For example, in the screenshot, the Animal Type link is chosen which results in the animals being displayed by the type of animal in alphabetical order (from cat to sheep).

![image](https://user-images.githubusercontent.com/18538465/88728682-19608480-d0e7-11ea-8ff9-5f23fe508000.png)


### Graphical Example 2 - Animal picture slideshow 

The stretch requirement idea to have a “Tinder-esque swipe” feature inspired us to add this picture slideshow.
It’s swipeable on mobile or touchscreen devices. We terminated our plan to make this a Tinder-esque swipe feature to adopt and delete pets as we thought it would be more appropriate to showcase how we have helped connecting pets to its adopters instead of removing our adopted pets.
 	The slideshow is implemented using bootstrap carousel and is very intuitive to use, clicking on the < previous and next > will show us the next/prev pictures of the pet. There are subtle indicators of how many pics the pet has at the bottom of the pics. The current view picture will be highlighted and as we move to the next/prev image, the indicator will move along.
	

<img width="603" alt="Screen Shot 2020-07-28 at 8 54 54 PM" src="https://user-images.githubusercontent.com/18538465/88754871-abcb4d00-d114-11ea-954e-da89e8b03976.png">

### Software Systems Overview
Our application is built on Rails 5, which is a robust framework that offers developers a lot of power to quickly build features. Rails follows a standard [Model-View-Controller (MVC) pattern](https://medium.com/the-renaissance-developer/ruby-on-rails-http-mvc-and-routes-f02215a46a84). 
The Model component of the application is solely concerned with the data that’s actually in the database. Usually Models will represent tables, and that pattern is followed in our application. In app/models/ there are files for each table. They have associations and other modules attached to them. Models are used to allow us to access/modify data from the database without having to directly write any SQL (through ActiveRecord). Models in our application include: AdminUser, AnimalProfile, Shelter, StatusUpdate, and User. 

The View component of the application is concerned with the presentation of the data to the user. In our application, the main medium of presentation is html and email. Since we have dynamic data, we use Views to render templates with our data (fetched through Controllers). In our applications these can be viewed in app/views. In particular, in app/views/devise is where the templates are stored for account registration/login as well as emails (confirmation, reset password, etc).

The Controller component of the application is the main driver of the application. It’s where models are fetched/modified and it also handles sending that data to the views. Our application controllers can be found at app/controllers.

Rails also has the concept of a Routes structure. Every route is mapped to a controller action in the application. This file can be found at config/routes.rb. Rails uses a domain specific language (DSL) which can be seen in our routes file. For example, using resources :animal_profiles will automatically generate common routes for that model including index, show, new, edit, create, update and destroy.
Additional Tools, APIs, Libraries, Etc

- Heroku
Heroku is a cloud platform as a service (PaaS) provider that allowed us to easily deploy our web application without having to worry too much about the infrastructure. It also has a huge library of integrations that we took advantage of to add more features to our application such as MailGun for email, Heroku Postgres for a free database, and Redis to Go for a free Redis server. It is also cleanly integrated with Github and allows automatic deploys off of the master branch. 
However it did have some quirks that we had to either deal with or accept. For example, file storage on Heroku is ephemeral. We wanted to allow users to be able to upload images for animal profiles. So we had to rely on an external service for file storage and decided to use AWS S3. Heroku also allows custom domains to be used for projects (by default it will initialize the project with a random URL). However, Heroku charges for SSL certificates to be set up for custom domains (we opted to forego setting that up for this project). 

- CircleCI
	CircleCI is a continuous integration tool that allows us to have automated builds and tests run on every commit to our Github repository. We ran light on tests but just having an automated build gave us greater confidence when pushing code to master. 

- Ruby/Rails 
	Initially only one member of our team had experience with Ruby on Rails. However after a week of ramping up the rest of the team was quickly able to start writing code for the application. Thankfully Ruby is a language intentionally designed to increase developer happiness, and while it has its own set of quirks, it’s a great language to pick up. Rails as a web application framework was also a great way for us to take advantage of a diverse library of open source Gems (Ruby libraries). For example we incorporated the Devise gem into our application to handle authentication. It’s a battle-tested solution that is used by countless applications and required minimal configuration to get up and running for our own application. Rolling your own security controls is definitely an option but prone to error.

- Resque/Redis 
	Rails historically used DelayedJobs for background jobs, which involved writing to a database for every job scheduled. This is bad practice and the community has shifted to use Resque with Redis. Redis is an in memory data store and Resque uses it to schedule background jobs to run in the future. We primarily use Resque to schedule weekly emails to users who want to receive a list of status updates posted on the website. We decided to have Resque schedule all weekly emails to run on Sunday mornings. If we needed to scale up we could easily spread out the jobs with Resque.
	
- Bootstrap
	Bootstrap has been one of the most helpful frameworks that take care of the front-end of our app, make our web app responsive and mobile friendly. Using bootstrap also gives us access to the carousel responsive and interactive slideshow which is created for presenting content, especially images. The carousel is a slideshow for cycling through a series of content, built with CSS 3D transforms and a bit of JavaScript. It works with a series of images, text, or custom markups. It also includes support for previous/next controls and indicators. We could also leave it flipping through images automatically without the controls. The Bootstrap’s touch support is set to true by default. 
Almost all our pages have some elements of bootstrap to beautify our already adorable pet images. Although bootstrap in Ruby is a little different, after our initial ramping up, we are so comfortable with both bootstrap and Ruby that we feel like they are made to be used alongside with each other.

- Deviations 
One stretch goal that we did not complete was to implement a Tinder-esque swipe feature for adopters to indicate interest. We left this feature unimplemented and decided that our application would require adopters to contact the shelter via telephone to indicate their interest. The shelter is then responsible for updating the animal profile status to the appropriate status. Ultimately, we believe in the “shelter” mission more than the “dating” mission. We believe we could have implemented the feature as it is quite similar to the carousel of pet slideshow. By updating the controls of the swipe right or left to adopt or remove a pet, we believe we could have this stretch feature ready in time. However, using this swiping feature to view pets seems to align with our aforementioned mission better than removing and adopting pets as a way to “date” pets.
We also did not use Trello as much as we had anticipated. We used it for the initial two weeks but dropped it afterwards. Since we met every week over Zoom and used Slack for any team coordination, we didn’t find any strong need for it. If we had been a larger team Trello would have been much more useful. 

 #### Conclusion
Working on the project was a joy as we got to channel our love for animals into developing a website that could potentially help find homes for them! We also found it a great way to explore new technologies and libraries. Working on this web application also revealed just how much work goes into building a full featured website, from crafting a polished user interface, keeping that user interface consistent for desktop and mobile, maintaining a solid backend, integrating with other services such as AWS, handling DNS records (fun!), and sending automated emails. There’s a lot of work that goes into each and every website. 


