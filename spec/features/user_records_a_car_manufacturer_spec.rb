require 'rails_helper'

feature "User records a car manufacturer" do
  # As a car salesperson
  # I want to record a car manufacturer
  # So that I can keep track of the types of cars found in the lot
  #
  # Acceptance Criteria:
  #
  # * I must specify a manufacturer name and country.
  # * If I do not specify the required information, I am presented with errors.
  # * If I specify the required information, the manufacturer is recorded and
  #   I am redirected to the index of manufacturers

  scenario 'user adds a new manufacturer ' do
    manufacturer = FactoryGirl.build(:manufacturer)
    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country

    click_on 'Submit'

    expect(page).to have_content 'Success'
    expect(page).to have_content 'Car Manufacturers'
    expect(page).to have_content manufacturer.name

  end

  scenario 'without required attributes' do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name

    click_on 'Submit'

    expect(page).to have_content "Country can't be blank"
    expect(page).to have_content "Name has already been taken"

  end



end
