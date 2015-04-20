class Post < ActiveRecord::Base
  attr_reader :user_id
  belongs_to :user
  default_scope{order('created_at DESC')}

  #validations
  validates(:content, presence: true, length: {maximum: 140})
  validates(:user_id, presence: true)
end
