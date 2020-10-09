class Volunteer
  attr_reader :id, :proj_id
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @proj_id = attributes.fetch(:proj_id)
  end
end