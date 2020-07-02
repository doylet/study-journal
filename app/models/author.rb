class Author < ApplicationRecord
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match", if: :password

  has_many :enrolments
  has_many :courses, through: :enrolments
end
