require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  redirect to('/projects')
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

post('/projects') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save()
  redirect to('/projects')
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.volunteers
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

post('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  name = params[:name]
  volunteer = Volunteer.new({:name => name, :proj_id => @project.id, :id => nil})
  volunteer.save
  @volunteers = @project.volunteers
  erb(:project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @project.update({:title => params[:title]})
  redirect to("/projects/#{params[:id].to_i()}")
end

delete('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @project.delete
  redirect to('/projects')
end

get('/volunteers') do
  @volunteers = Volunteer.all
  erb(:volunteers)
end

post('/volunteers') do
  name = params[:name]
  volunteer = Volunteer.new({:name => name, :proj_id=> nil, :id => nil})
  volunteer.save()
  redirect to('/volunteers')
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id].to_i())
  erb(:volunteer)
end

get('/volunteers/:id/edit') do
  @volunteer = Volunteer.find(params[:id].to_i())
  erb(:edit_volunteer)
end

patch('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id].to_i)
  @volunteer.update({:name => params[:name]})
  redirect to("/volunteers/#{params[:id].to_i()}")
end

delete('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id].to_i)
  @volunteer.delete
  redirect to('/volunteers')
end

