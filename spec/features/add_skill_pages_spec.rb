require 'rails_helper'

describe "the add a skill process" do
  it "adds a new skill" do
    visit skills_path
    click_on 'Add a skill'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Description', :with => 'Ruby is ...'
    click_on 'Create Skill'
    expect(page).to have_content 'Skill successfully added!'
  end

  it "gives error when no name is entered" do
    visit new_skill_path
    click_on 'Create Skill'
    expect(page).to have_content 'errors'
  end
end
