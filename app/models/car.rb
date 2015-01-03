class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :year,
    presence: true, inclusion: { in: 1920..3000, message: "must be 1920 or later"}

  validates :name,
    presence: true

  validates :color,
    presence: true

  validates :mileage,
    presence: true
end
