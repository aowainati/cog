require 'obfuscate'
require 'open-uri'

class Photo < ActiveRecord::Base
  include Obfuscate

  has_attached_file :image_file, :styles => { :large => "500x500", :thumb => "100x100" }, :default_url => "/images/:style/derp.png"

  validates_attachment_presence :image_file
  validates_attachment_size :image_file, :less_than => 500.kilobytes
  validates_attachment_content_type :image_file, :content_type => ['image/jpeg', 'image/png']

  def self.random
    if (c = count) != 0
      find(:first, :offset => rand(c))
    end
  end

  def self.find_by_encrypted_key(id)
    Photo.find(Photo.decrypt(id))
  end

  def to_param
    encrypt(id)
  end
end
