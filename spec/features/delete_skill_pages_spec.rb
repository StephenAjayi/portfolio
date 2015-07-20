require 'rails_helper'

describe "the delete a skill process" do
  it "deletes a skill" do
    skill = Skill.create(:name => 'Ruby', :description => "ruby is..")
    visit skill_path(skill)
    click_on 'Delete skill'
    page.accept_alert do
      click_link 'Show Alert'
    end
    expect(page).to have_content 'Skill successfully updated!'
  end
end
