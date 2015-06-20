class Documentet < ActiveRecord::Base
  has_attached_file :attachmentet, :styles => { 
  	:thumb => "242x200#" }

  validates_presence_of :attachmentet, :message => "can't be empty"
  validates_attachment_content_type :attachmentet, :content_type => %w(image/jpeg image/jpg image/png)



  attr_accessor :remove_attachmentet

  before_save :perform_attachmentet_removal
  def perform_attachmentet_removal
  	if remove_attachmentet == '1'
  		self.attachmentet = nil
  	end
  end



end
