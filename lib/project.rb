class Project
  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def save 
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(param)
    self.title() == param.title()
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    title = project.fetch("title")
    id = project.fetch("id").to_i
    Project.new({:title => title, :id => id})
  end

  def update(attributes)
    @title = attributes.fetch(:title)
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
    DB.exec("DELETE FROM volunteers WHERE proj_id = #{@id};")
  end

  def volunteers
    volunteers = []
    results = DB.exec("SELECT * FROM volunteers WHERE proj_id = #{@id};")
    results.each() do |result|
      id = result.fetch("id").to_i
      proj_id = result.fetch("proj_id").to_i
      name = result.fetch("name")
      volunteer = Volunteer.new({:name => name, :proj_id => proj_id, :id => id})
      volunteers.push(volunteer)
    end
    volunteers
  end
end