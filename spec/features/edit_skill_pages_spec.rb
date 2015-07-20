require 'rails_helper'

describe "the edit a skill process" do
  it "edits a skill" do
    skill = Skill.create(:name => 'Ruby', :description => "ruby is..")
    visit skill_path(skill)
    click_on 'Edit skill'
    fill_in 'Name', :with => 'Rails'
    fill_in 'Description', :with => 'Rails is ...'
    click_on 'Update Skill'
    expect(page).to have_content 'Skill successfully updated!'
  end

  it "gives error when no description is entered" do
    skill = Skill.create(:name => 'Ruby', :description => "ruby is..")
    visit skill_path(skill)
    click_on 'Edit skill'
    fill_in 'Name', :with => 'Rails'
    fill_in 'Description', :with => ''
    click_on 'Update Skill'
    expect(page).to have_content 'errors'
  end
end
