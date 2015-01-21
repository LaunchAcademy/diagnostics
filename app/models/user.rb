class User < ActiveRecord::Base
  has_many :answer_submissions

  validates :name, presence: true
  validates :provider, presence: true
  validates :provider, inclusion: { in: %w(github) }
  validates :uid, presence: true
  validates :uid, uniqueness: { scope: :provider }
  validates :role, inclusion: { in: %w(student admin) }

  def self.find_or_create_via_omniauth(auth)
    return nil if auth.nil? || auth.empty?

    user = User.find_or_initialize_by(provider: auth['provider'], uid: auth['uid'])
    user.name = auth['info']['name']
    user.email = auth['info']['email']
    user.image = auth['info']['image']
    user.save!
    user
  end

  def admin?
    role == "admin"
  end
end
