require 'rails_helper'

describe "the add a project process" do
  it "adds a new skill" do
    visit skills_path
    click_on 'Add a skill'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Description', :with => 'Ruby is ...'
    click_on 'Create Skill'
    click_on 'Ruby'
    click_on 'Add a project'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Description', :with => 'Ruby is ...'
    fill_in 'Url', :with => 'http://Ruby.com'
    click_on 'Create Project'

    expect(page).to have_content 'project successfully added!'
  end

  it "gives error when no url is entered" do
    skill = Skill.create(:name => 'Ruby', :description => "ruby is ...")
    project = Project.create(:name => "ska", :description => 'ruby prject', :url => "", :skill_id => skill.id)
    visit new_skill_path(project)
    click_on 'Create Skill'
    expect(page).to have_content 'errors'
  end
end
