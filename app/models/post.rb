class Post < ActiveRecord::Base
  attr_accessible :content, :user_id, :visible

  belongs_to :user
end
