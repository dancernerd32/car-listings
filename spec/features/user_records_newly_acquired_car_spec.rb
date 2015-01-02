require 'rails_helper'


feature "User records newly acquired car" do
  # As a car salesperson
  # I want to record a newly acquired car
  # So that I can list it in my lot
  #
  # Acceptance Criteria:
  #
  # *I must specify the manufacturer, color, year, and mileage of the car
  #  (an association between the car and an existing manufacturer should be created).
  # *Only years from 1920 and above can be specified.
  # *I can optionally specify a description of the car.
  # *If I enter all of the required information in the required formats,
  #  the car is recorded and I am presented with a notification of success.
  # *If I do not specify all of the required information in the required formats,
  #  the car is not recorded and I am presented with errors.
  # *Upon successfully creating a car, I am redirected back to the index of cars.

  scenario 'user adds new car' do
    car = FactoryGirl.build(:car)

    visit new_manufacturer_car_path(car.manufacturer)

    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage

    click_on 'Submit'
    

    expect(page).to have_content 'Success'
    expect(page).to have_content car.manufacturer.name
    expect(page).to have_content car.year
    expect(page).to have_content car.color
    expect(page).to have_content car.mileage

  end

  scenario 'without required attributes - blank'
  scenario 'without required attributes - year before 1920'




end
