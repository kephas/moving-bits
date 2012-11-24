class User < ActiveRecord::Base
  attr_accessible :access_token, :name
end
