class Book < ActiveRecord::Base
  belongs_to :universe
  has_attached_file :cover
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
end