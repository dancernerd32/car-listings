require 'rails_helper'

feature 'User views manufacturers', %{
  As a user
  I want to view manufacturers
  So I can find and add new cars
} do

  # Acceptance Criteria
  # * Visiting the root path takes me to the manufacturers list
  # * I see all manufacturers that have been added
  # * I can click on a link to add a new manufacturer

  scenario 'user views manufacturers' do
    manufacturer1 = FactoryGirl.create(:manufacturer)
    manufacturer2 = FactoryGirl.create(:manufacturer)

    visit root_path

    expect(page).to have_content manufacturer1.name
    expect(page).to have_content manufacturer2.name
    expect(page).to have_content "Select a manufacturer to view or add cars"

    click_on "Add a manufacturer"

    expect(page).to have_content "Country"
  end
  scenario 'no manufacturers have been added' do

    visit root_path
    save_and_open_page


    expect(page).to have_content "Select a manufacturer to view or add cars"


    click_on "Add a manufacturer"

    expect(page).to have_content "Country"
  end


end
