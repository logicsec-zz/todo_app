# Simple ToDo App Using Angular with OAuth integration

This is a todo list management application, written in Rails 4 and AngularJS. Tasks support CRUD operations as well as drag&drop sorting and setting due dates via a popup calendar. All task operations are done on the client side and synchronized to the server. The application sports a RESTful API used by AngularJS SPA and also usable standalone.





## Setup

### Clone Repo
```sh
git clone https://github.com/nickmc01/todo_app.git
```

### Configure
Rename database.yml.example to database.yml in your config folder and add in your credentials.

Please check out this article to setup your Facebook and Google Applications
https://scotch.io/tutorials/integrating-social-login-in-a-ruby-on-rails-application
Create a .env file in your files root directory and add the following filling out the details.

```sh
FACEBOOK_APP_ID=''
FACEBOOK_APP_SECRET=''

GOOGLE_CLIENT_ID=''
GOOGLE_APP_SECRET=''
```

### Bundler
Run the following
```sh
bundle install
```

### Rake
Next we will setup our database.
```sh
rake db:setup
```

Once the setup is complete, you will notice that a lot of information was added.

### Run
A small note, due to Facebook restrictions, you cannot share to Facebook while on localhost. That being said, I suggest setting up Heroku to view the app.
```sh
heroku login #enter your login credentials
git add . #adds your files to the git repository
git commit -m "Initial Commit" # You can change initial commit to anything.
git push heroku master # If you are on a different branch, use git push heroku BRANCH_NAME:master
```

You should now see a URL after it is finished with the setup. As of right now, your app wont work. We need to run:
```sh
heroku run rake db:migrate
heroku config:set heroku config:set GOOGLE_APP_ID=PUT_YOUR_GOOGLE_APP_ID_HERE GOOGLE_APP_SECRET=PUT_YOUR_GOOGLE_APP_SECRET_HERE
heroku config:set FACEBOOK_APP_ID=PUT_YOUR_FACEBOOK_APP_ID_HERE FACEBOOK_APP_SECRET=PUT_YOUR_GOOGLE_APP_SECRET_HERE
```
This will run the migrations and setup your environment to allow OAuth to work.



And that's it. You should have a working ToDo list. If you find any bugs or have suggestions to make this better, feel free to open a new issue and I will get working on it.
