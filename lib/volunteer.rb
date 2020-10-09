class Volunteer
  attr_reader :id, :proj_id
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @proj_id = attributes.fetch(:proj_id)
  end

  def ==(attr)
    if attr != nil
      (self.name() == attr.name() && (self.proj_id() == attr.proj_id()))
    else
      false
    end
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, proj_id) VALUES ('#{@name}', #{@proj_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end
  
  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      proj_id = volunteer.fetch("proj_id").to_i
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :proj_id => proj_id, :id => id}))
    end
    volunteers
  end

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    name = volunteer.fetch("name")
    proj_id = volunteer.fetch("proj_id").to_i
    id = volunteer.fetch("id").to_i
    Volunteer.new({:name => name, :proj_id => proj_id, :id => id})
  end

end