class Project
  attr_accessor :name
  attr_reader :id

  @@projects = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@projects.values()
  end

  def save
    @@projects[self.id] = Project.new({ :name => self.name, :id => self.id })
  end

  def ==(project_to_compare)
    self.name() == project_to_compare.name()
  end

  def self.clear
    @@projects = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@projects[id]
  end

  def update(name)
    self.name = name
    @@projects[self.id] = Project.new({ :name => self.name, :id => self.id })
  end

  def delete
    @@projects.delete(self.id)
  end

  def volunteers
    Volunteer.find_by_project(self.id)
  end
end
