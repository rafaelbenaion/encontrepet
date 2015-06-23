class Lost < ActiveRecord::Base
	 belongs_to :user 
   has_many :comments

  has_attached_file :photo, :styles => {:thumb => "242x200#"}
  validates_attachment_content_type :photo, content_type: %w(image/jpeg image/jpg image/png)



    validates :name, presence: true
    validates :animal, presence: true
    validates :gender, presence: true
    validates :size, presence: true
    validates :about, presence: true
    validates :bairro, presence: true
    validates :date, presence: true
    validates :city, presence: true
    validates :phone, presence: true
    validates :user_id, presence: true
    validates :photo, :attachment_presence => true

end
