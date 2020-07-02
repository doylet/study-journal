class Course < ApplicationRecord
  has_many :enrolments
  has_many :authors, through: :enrolments
  
  before_save :downcase_code_field


  def set_article_not_null
    self.articles_id = 1
  end

  def upcase_code_field
    self.code.upcase
  end

  def downcase_code_field
    self.code.downcase
  end
end
