# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)

# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)

# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

#Model.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

#did this separately via terminal commands prior to running this file to add the data in

#rails generate model Studio 
#added t.string "names" to the new db file 


#rails generate model Movie 
#added 
#t.string "title"
#t.integer "year_released"
#t.string "rated"
#t.integer "studio_id" to new db file 

#rails generate model Actor 
#add t.string "name" to new db file

#rails generate model Role 
#added 
#t.integer "movie_id"
#t.integer "actor_id"
#t.string "character_name" to new db file

#run below once you've added the appropriate data structures to the db file
#rails db:migrate


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

#movies
batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = 2005
batman_begins["rated"]= "PG-13"
batman_begins.save

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = 2008
dark_knight["rated"] = "PG-13"
dark_knight.save

dark_knight_rises = Movie.new
dark_knight_rises["title"] = "The Dark Knight Rises"
dark_knight_rises["year_released"] = 2012
dark_knight_rises["rated"] = "PG-13"
dark_knight_rises.save

#actors
newactor = Actor.new
newactor["name"] = "Christian Bale"
newactor.save

newactor = Actor.new
newactor["name"] = "Michael Caine"
newactor.save

newactor = Actor.new
newactor["name"] = "Liam Neeson"
newactor.save

newactor = Actor.new
newactor["name"] = "Katie Holmes"
newactor.save

newactor = Actor.new
newactor["name"] = "Gary Oldman"
newactor.save

newactor = Actor.new
newactor["name"] = "Heath Ledger"
newactor.save

newactor = Actor.new
newactor["name"] = "Aaron Eckhart"
newactor.save

newactor = Actor.new
newactor["name"] = "Maggie Gyllenhaal"
newactor.save

newactor = Actor.new
newactor["name"] = "Tom Hardy"
newactor.save

newactor = Actor.new
newactor["name"] = "Joseph Gordon-Levitt"
newactor.save

newactor = Actor.new
newactor["name"] = "Anne Hathaway"
newactor.save

#roles 

bale = Actor.find_by({"name" => "Christian Bale"})
batmanbegins = Movie.find_by({"title" => "Batman Begins"})

newrole = Role.new
newrole["movie_id"] = batmanbegins["id"]
newrole["actor_id"] = bale["id"]
newrole["character_name"] = "Bruce Wayne"
newrole.save

caine = Actor.find_by({"name" => "Michael Caine"})
batmanbegins = Movie.find_by({"title" => "Batman Begins"})

newrole = Role.new
newrole["movie_id"] = batmanbegins["id"]
newrole["actor_id"] = caine["id"]
newrole["character_name"] = "Alfred"
newrole.save

neeson = Actor.find_by({"name" => "Liam Neeson"})
batmanbegins = Movie.find_by({"title" => "Batman Begins"})

newrole = Role.new
newrole["movie_id"] = batmanbegins["id"]
newrole["actor_id"] = neeson["id"]
newrole["character_name"] = "Ra's Al Ghul"
newrole.save

holmes = Actor.find_by({"name" => "Katie Holmes"})
batmanbegins = Movie.find_by({"title" => "Batman Begins"})

newrole = Role.new
newrole["movie_id"] = batmanbegins["id"]
newrole["actor_id"] = holmes["id"]
newrole["character_name"] = "Rachel Dawes"
newrole.save

oldman = Actor.find_by({"name" => "Gary Oldman"})
batmanbegins = Movie.find_by({"title" => "Batman Begins"})

newrole = Role.new
newrole["movie_id"] = batmanbegins["id"]
newrole["actor_id"] = oldman["id"]
newrole["character_name"] = "Commissioner Gordon"
newrole.save

bale = Actor.find_by({"name" => "Christian Bale"})
darkknight = Movie.find_by({"title" => "The Dark Knight"})

newrole = Role.new
newrole["movie_id"] = darkknight["id"]
newrole["actor_id"] = bale["id"]
newrole["character_name"] = "Bruce Wayne"
newrole.save

heath = Actor.find_by({"name" => "Heath Ledger"})
darkknight = Movie.find_by({"title" => "The Dark Knight"})

newrole = Role.new
newrole["movie_id"] = darkknight["id"]
newrole["actor_id"] = heath["id"]
newrole["character_name"] = "Joker"
newrole.save

aaron = Actor.find_by({"name" => "Aaron Eckhart"})
darkknight = Movie.find_by({"title" => "The Dark Knight"})

newrole = Role.new
newrole["movie_id"] = darkknight["id"]
newrole["actor_id"] = aaron["id"]
newrole["character_name"] = "Harvey Dent"
newrole.save

caine = Actor.find_by({"name" => "Michael Caine"})
darkknight = Movie.find_by({"title" => "The Dark Knight"})

newrole = Role.new
newrole["movie_id"] = darkknight["id"]
newrole["actor_id"] = caine["id"]
newrole["character_name"] = "Alfred"
newrole.save

maggie = Actor.find_by({"name" => "Maggie Gyllenhaal"})
darkknight = Movie.find_by({"title" => "The Dark Knight"})

newrole = Role.new
newrole["movie_id"] = darkknight["id"]
newrole["actor_id"] = maggie["id"]
newrole["character_name"] = "Rachel Dawes"
newrole.save

bale = Actor.find_by({"name" => "Christian Bale"})
darkknightrises = Movie.find_by({"title" => "The Dark Knight Rises"})

newrole = Role.new
newrole["movie_id"] = darkknightrises["id"]
newrole["actor_id"] = bale["id"]
newrole["character_name"] = "Bruce Wayne"
newrole.save

oldman = Actor.find_by({"name" => "Gary Oldman"})
darkknightrises = Movie.find_by({"title" => "The Dark Knight Rises"})

newrole = Role.new
newrole["movie_id"] = darkknightrises["id"]
newrole["actor_id"] = oldman["id"]
newrole["character_name"] = "Commissioner Gordon"
newrole.save

hardy = Actor.find_by({"name" => "Tom Hardy"})
darkknightrises = Movie.find_by({"title" => "The Dark Knight Rises"})

newrole = Role.new
newrole["movie_id"] = darkknightrises["id"]
newrole["actor_id"] = hardy["id"]
newrole["character_name"] = "Bane"
newrole.save

jgl = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
darkknightrises = Movie.find_by({"title" => "The Dark Knight Rises"})

newrole = Role.new
newrole["movie_id"] = darkknightrises["id"]
newrole["actor_id"] = jgl["id"]
newrole["character_name"] = "John Blake"
newrole.save

anne = Actor.find_by({"name" => "Anne Hathaway"})
darkknightrises = Movie.find_by({"title" => "The Dark Knight Rises"})

newrole = Role.new
newrole["movie_id"] = darkknightrises["id"]
newrole["actor_id"] = anne["id"]
newrole["character_name"] = "Selina Kyle"
newrole.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""


# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
