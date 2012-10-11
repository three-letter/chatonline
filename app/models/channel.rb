class Channel < ActiveRecord::Base
  
  validates_presence_of :name 
  validates_uniqueness_of :name
  
  before_validation :generate_uuid

  
  private 

    def generate_uuid
      self.uuid = UUID.generate
    end

end
