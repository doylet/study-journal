class Course < ApplicationRecord
  has_many :articles
  has_many :enrolments
  has_many :authors, through: :enrolments
  has_many :tags, through: :articles

  before_save :downcase_code_field

  # def tags
  #     @tags || articles.map{|article| article.tags}.flatten.compact
  # end

  def downcase_code_field
    self.code.downcase
  end
end
