class Volunteer
  attr_reader :id
  attr_accessor :name, :project_id

  @@volunteers = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def ==(volunteer_to_compare)
    (self.name() == volunteer_to_compare.name()) && (self.project_id() == volunteer_to_compare.project_id())
  end

  def self.all
    @@volunteers.values
  end

  def save
    @@volunteers[self.id] = Volunteer.new({:name => self.name, :project_id => self.project_id, :id => self.id})
  end

  def self.find(id)
    @@volunteers[id]
  end

  def update(name, project_id)
    self.name = name
    self.project_id = project_id
    @@volunteers[self.id] = Volunteer.new({:name => self.name, :project_id => self.project_id, :id => self.id})
  end

  def delete
    @@volunteers.delete(self.id)
  end

  def self.clear
    @@volunteers = {}
  end

  def self.find_by_project(alb_id)
    volunteers = []
    @@volunteers.values.each do |volunteer|
      if volunteer.project_id == alb_id
        volunteers.push(volunteer)
      end
    end
    volunteers
  end

  def project
    Project.find(self.project_id)
  end
end
