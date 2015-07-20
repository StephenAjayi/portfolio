require 'rails_helper'

describe "the delete a skill process" do
  it "deletes a skill" do
    skill = Skill.create(:name => 'Ruby', :description => "ruby is..")
    project = Project.create(:name => "ska", :description => 'ruby prject', :url => "http://...", :skill_id => skill.id)
    visit skill_path(skill)
    click_on 'Delete'
    expect(page).to have_content 'Project successfully destroyed!'
  end
end
