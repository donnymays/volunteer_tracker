# _Volunteer Tracker_

_9 October 2020_

#### _Application that will allow a user to create projects with corresponding volunteers_

#### By _**Donny Mays**_

## Setup/Installation Requirements
- In terminal/command line, navigate into the directory where you would like to create a new Ruby project.
- Clone this project using the 'git clone https://github.com/donnymays/volunteer_tracker.git' command in terminal/command line while in the desired directory.
- Navigate to the cloned folder and run 'bundle' in your command line to download gem dependencies.
- Postgres is necessary to work with the databases of this application. To learn about installing and running it visit: https://www.postgresql.org/docs/9.3/tutorial-install.html.
- Once postgres is running, open another terminal and run psql.
- To create the databases referenced in this app use the following:
    
    -# CREATE DATABASE volunteer_tracker;
    -# \c volunteer_tracker;
    -# CREATE TABLE projects (id serial PRIMARY KEY, name varchar);
    -# CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int);
    -# CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;

- Run 'ruby app.rb' in the terminal while still in the root directory of the new project. 
- Open a browser and type the localhost port that Sinatra gives in the terminal (ex:localhost:4567)

## Description
_This is a project for Week 3 of the Ruby block of Epicodus.  Prompt can be seen below._

_The original instructions for the assignment include:_
Last week, you did a volunteer project for a non-profit. While working on the project, you met the non-profit's IT manager. She's building an internal website to track volunteers working on projects and she'd like your help. Each project should have many volunteers, but a volunteer can only work on one project at a time (a one-to-many relationship). The IT manager has a great deal of experience with SQL so she prefers using SQL for database queries. Fortunately, you know how to integrate raw SQL queries into your application!

The IT manager also believes in testing so she's written the tests herself. You can find the tests here. All tests must be passing. To get one test passing at a time (as usual, you should commit for each passing test), it's recommended to comment out tests you don't need until you're ready to run them.

You may alter a unit test only if you are adding more attributes to volunteers or projects.
You may (and should) add more unit tests if you decide to add additional features or if there are any methods that aren't covered by the included tests.
You may alter the names of buttons and fields in the Capybara tests. You may also add additional tests. However, your integration specs should otherwise use the current provided tests unaltered.
If there is an error or bug in any of the tests, you may correct that error.
Volunteer Tracker
Create an application that tracks projects and the volunteers working on them. Each volunteer will belong to only one project (one project, many volunteers).

The following user stories should be completed:

As a non-profit employee, I want to view, add, update and delete projects.
As a non-profit employee, I want to view and add volunteers.
As a non-profit employee, I want to add volunteers to a project.



## Specifications
| Spec     | Story | Action    |
| -------- | -------- | -------- |
| 1 | As a non-profit employee, I want to view, add, update and delete projects. | CRUD functionality for a projects |
| 2 | As a non-profit employee, I want to view and add volunteers. | Create and Read functionality for volunteers |
| 3 |  As a non-profit employee, I want to add volunteers to a project.| Join volunteers to a project via proj_id attribute |


## Known Bugs
_There are no known bugs at this time_

## Technologies Used
* Ruby
* HTML
* CSS
* Bootstap CSS framework
* Postgres
* psql
* Gems: rspec, pry, sinatra, capybara

### License
Copyright (c) 2020 **_Donny Mays_**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.