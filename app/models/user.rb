class User < ActiveRecord::Base
  
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true,
  						   uniqueness: true,
  						   format: { 
  						   	with: /\A[a-zA-Z0-9]+\Z/,
  						   	message: 'Não pode ter espaços ou outros caracteres.' 
  						   }



 has_many :posts
 has_many :conversations, :foreign_key => :sender_id

 def name
 	first_name + " " + last_name
 end

  after_create :create_default_conversation


  private

  # for demo purposes

  def create_default_conversation
    Conversation.create(sender_id: 1, recipient_id: self.id) unless self.id == 1
  end


end
