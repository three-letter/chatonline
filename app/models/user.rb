class User < ActiveRecord::Base
  validates_presence_of :name, :github_id
  validates :github_id, uniqueness: true

  class << self
    def matches? request
      !request.session[:user_id].blank?
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.github_id = auth['uid']
      if auth['info']
         user.name = auth['info']['nickname'] || ""
      end
    end
  end

end
