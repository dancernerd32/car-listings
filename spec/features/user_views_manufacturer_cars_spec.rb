require 'rails_helper'

feature "User views a manufacturer's cars", %{
  As a user
  I want to view a manufacturer's cars
  So I can choose a car to see the details
} do

  scenario "User views a manufacturer's page that has cars" do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer: manufacturer)

    visit root_path

    click_on manufacturer.name

    expect(page).to have_content manufacturer.name
    expect(page).to have_content manufacturer.country
    expect(page).to have_content car.name
    expect(page).to have_content "Record New Car"
  end

  scenario "User views the manufacturer's page with no cars" do
    manufacturer = FactoryGirl.create(:manufacturer)

    visit root_path

    click_on manufacturer.name

    expect(page).to have_content manufacturer.name
    expect(page).to have_content manufacturer.country
    expect(page).to have_content "Record New Car"
  end
end
