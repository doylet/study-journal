class Comment < ApplicationRecord
  belongs_to :article
  
  has_attached_file :image, styles: {large: "1440>", medium: "960>", small: "640>", thumb: "300>"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

end
