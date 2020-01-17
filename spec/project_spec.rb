require 'rspec'
require 'project'
require 'volunteer'
require 'pry'

describe '#Project' do

  before(:each) do
    Project.clear
    Volunteer.clear
  end

  describe('.all') do
    it("returns an empty array when there are no projects") do
      expect(Project.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an project") do
      project = Project.new({:name => "A Love Supreme", :id => nil})
      project.save()
      project2 = Project.new({:name => "Blue", :id => nil})
      project2.save()
      expect(Project.all).to(eq([project, project2]))
    end
  end

  describe('.clear') do
    it("clears all projects") do
      project = Project.new({:name => "A Love Supreme", :id => nil})
      project.save()
      project2 = Project.new({:name => "Blue", :id => nil})
      project2.save()
      Project.clear
      expect(Project.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same project if it has the same attributes as another project") do
      project = Project.new({:name => "Blue", :id => nil})
      project2 = Project.new({:name => "Blue", :id => nil})
      expect(project).to(eq(project2))
    end
  end

  describe('.find') do
    it("finds an project by id") do
      project = Project.new({:name => "A Love Supreme", :id => nil})
      project.save()
      project2 = Project.new({:name => "Blue", :id => nil})
      project2.save()
      expect(Project.find(project.id)).to(eq(project))
    end
  end

  describe('#update') do
    it("updates an project by id") do
      project = Project.new({:name => "A Love Supreme", :id => nil})
      project.save()
      project.update("A Love Supreme")
      expect(project.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an project by id") do
      project = Project.new({:name => "A Love Supreme", :id => nil})
      project.save()
      project2 = Project.new({:name => "Blue", :id => nil})
      project2.save()
      project.delete()
      expect(Project.all).to(eq([project2]))
    end
  end

  describe('#volunteers') do
    it("returns an project's volunteers") do
      project = Project.new({:name => "A Love Supreme", :id => nil})
      project.save()
      volunteer = Volunteer.new({:name => "Naima", :project_id => project.id, :id => nil})
      volunteer.save()
      volunteer2 = Volunteer.new({:name => "Cousin Mary", :project_id => project.id, :id => nil})
      volunteer2.save()
      expect(project.volunteers).to(eq([volunteer, volunteer2]))
    end
  end
end
