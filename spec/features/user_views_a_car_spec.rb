require 'rails_helper'

feature "User views a car's details" do
  # As a car salesperson
  # I want to view a car's details
  # So that I can know more about the cars in my lot
  #
  # Acceptance Criteria:
  #
  # *When I click on the car from the cars index page I should be taken to the
  #  car's details page
  # *I must see the car's name, year, color, mileage, and manufacturer
  # *If a description was provided, I must see the car's description
  # *If no description was provided, there must not be a section for the description

  scenario 'user views a car with description' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer: manufacturer)


    visit manufacturer_cars_path(manufacturer)


    click_on "#{car.year} #{car.name} (#{car.color})"

    expect(page).to have_content car.name
    expect(page).to have_content car.year
    expect(page).to have_content car.mileage
    expect(page).to have_content car.manufacturer.name
    expect(page).to have_content car.description
  end

  scenario 'user views a car with no description' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer: manufacturer, description: nil)


    visit manufacturer_cars_path(manufacturer)


    click_on "#{car.year} #{car.name} (#{car.color})"

    expect(page).to have_content car.name
    expect(page).to have_content car.year
    expect(page).to have_content car.mileage
    expect(page).to have_content car.manufacturer.name
    expect(page).not_to have_content "Description"
  end
end
