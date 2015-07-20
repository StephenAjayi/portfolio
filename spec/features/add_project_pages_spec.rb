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
    visit skill_path(skill)
    click_on 'Add a project'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Description', :with => 'Ruby is ...'
    fill_in 'Url', :with => ''
    click_on 'Create Project'
    expect(page).to have_content 'errors'
  end
end
