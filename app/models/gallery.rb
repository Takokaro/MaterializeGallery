class Gallery < ActiveRecord::Base
  has_many :paintings

  validates :name, presence: true,
                   length: { minimum: 3 }


  def gallery_cover
    paintings.shuffle.first.image_url(:thumb)
  end

end
