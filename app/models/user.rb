class User < ActiveRecord::Base
  validates :name, presence: true
  validates :provider, presence: true
  validates :uid, presence:true
  validates_uniqueness_of :uid, scope: :provider

  def self.find_or_create_via_omniauth(auth)
    user = User.find_or_initialize_by(provider: auth['provider'], uid: auth['uid'])
    user.name = auth['info']['name']
    user.email = auth['info']['email']
    user.image = auth['info']['image']
    user.save!
    user
  end
end
