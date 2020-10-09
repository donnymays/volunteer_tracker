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

end