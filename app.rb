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

get('/projects/:id/volunteers') do
  @volunteers = Volunteer.all
  erb(:volunteers)
end

post('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i)
  name = params[:name]
  @volunteer = Volunteer.new({:name => name, :proj_id => @project.id, :id => nil})
  @volunteer.save()
  redirect to("/projects/#{params[:id].to_i()}")
end

get('/projects/:id/volunteers/:vol_id') do
  @project = Project.find(params[:id].to_i)
  @volunteer = Volunteer.find(params[:vol_id].to_i())
  erb(:volunteer)
end

patch('/projects/:id/volunteers/:vol_id') do
  @project = Project.find(params[:id].to_i)
  @volunteer = Volunteer.find(params[:vol_id].to_i)
  @volunteer.update({:name => params[:name]})
 erb(:volunteer)
end


