require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an project path', {:type => :feature}) do
  it('creates an project and then goes to the project page') do
    visit('/projects')
    click_on('Add a new project')
    fill_in('project_name', :with => 'Yellow Submarine')
    click_on('Add project')
    expect(page).to have_content('Yellow Submarine')
  end
end

describe('create a volunteer path', {:type => :feature}) do
  it('creates an project and then goes to the project page') do
    project = Project.new({:name => "Yellow Submarine", :id => nil})
    project.save
    visit("/projects/#{project.id}")
    fill_in('volunteer_name', :with => 'All You Need Is Love')
    click_on('Add volunteer')
    expect(page).to have_content('All You Need Is Love')
  end
end
