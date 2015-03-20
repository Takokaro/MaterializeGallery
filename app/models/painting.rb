class Painting < ActiveRecord::Base
  belongs_to :gallery
  mount_uploader :image, ImageUploader

  validates :image, presence: true,
                   length: { minimum: 3 }
  validates :name, presence: true,
                   length: { minimum: 3 }

  def snaked_name
    name.downcase.gsub(' ', '_')
  end

end
