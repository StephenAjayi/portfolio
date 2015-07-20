require 'rails_helper'

describe "the delete a skill process" do
  it "deletes a skill" do
    skill = Skill.create(:name => 'Ruby', :description => "ruby is..")
    visit skill_path(skill)
    click_on 'Delete skill'
    expect(page).to have_content 'Skill successfully destroyed!'
  end
end
