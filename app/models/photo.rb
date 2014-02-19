class Photo < ActiveRecord::Base
  has_attached_file :image_file, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/derp.png"

  validates_attachment_presence :image_file
  validates_attachment_size :image_file, :less_than => 500.kilobytes
  validates_attachment_content_type :image_file, :content_type => ['image/jpeg', 'image/png']
end
