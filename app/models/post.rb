class Post < ActiveRecord::Base
	
    belongs_to :documentet
    accepts_nested_attributes_for :documentet
    belongs_to :user 


	validates :name, presence: true
    validates :age, presence: true
    validates :animal, presence: true
    validates :gender, presence: true
    validates :size, presence: true
    validates :about, presence: true
    validates :user_id, presence: true
    validates :castrado, presence: true
    validates :vacinado, presence: true
    validates :cidade, presence: true
    validates :telefone, presence: true
    
      scope :animal, -> (animal) { where("animal like ?", "#{animal}%")}
      scope :gender, -> (gender) { where("gender like ?", "#{gender}%")}
      scope :starts_with, -> (name) { where("LOWER(name) like ?", "#{name.downcase}%")}
      scope :castrado, -> (castrado) { where("castrado like ?", "#{castrado}%")}
      scope :vacinado, -> (vacinado) { where("vacinado like ?", "#{vacinado}%")}
      scope :tamanho, -> (size) { where("size like ?", "#{size}%")}

end
