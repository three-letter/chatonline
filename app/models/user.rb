class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.github_id = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

end
