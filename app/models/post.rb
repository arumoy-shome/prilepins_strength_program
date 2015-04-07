class Post < ActiveRecord::Base
  attr_accessor :content
  belongs_to :user
  default_scope{order('created_at DESC')}

  #validations
  validates(:content, presence: true, length: {maximum: 140})
  validates(:user_id, presence: true)
end
