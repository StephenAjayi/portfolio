require 'rails_helper'

describe "the edit a project process" do
  it "edits a project" do
    skill = Skill.create(:name => 'Ruby', :description => "ruby is ...")
    project = Project.create(:name => "ska", :description => 'ruby project', :url => "http...", :skill_id => skill.id)
    visit skill_path(skill)
    click_on 'Edit'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Description', :with => 'Ruby is ...'
    fill_in 'Url', :with => 'http://Ruby.com'
    click_on 'Update Project'
    expect(page).to have_content 'Project successfully updated!'
  end



  it "gives error when no name is entered" do
    skill = Skill.create(:name => 'Ruby', :description => "ruby is ...")
    project = Project.create(:name => "ska", :description => 'ruby prject', :url => "http://...", :skill_id => skill.id)
    visit skill_path(skill)
    click_on 'Edit'
    fill_in 'Name', :with => ''
    fill_in 'Description', :with => 'Ruby is ...'
    fill_in 'Url', :with => 'http://Ruby.com'
    click_on 'Update Project'
    expect(page).to have_content 'errors'
  end
end
