class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :set_default_avatar

  # Validations
  validates :first_name, :last_name, :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :email, confirmation: true

  validates :first_name, :last_name,
            format: { with: /[A-Za-z]+/,
                      message: 'should contain only letters' }

  validates :username,
            format: { with: /\A(?=[a-zA-Z0-9._-]{5,20}$)(?!.*[_.]{2})[^_.].*[^_.]\z/,
                      message: 'should contain between 5 and 20 characters' }

  def set_default_avatar
    return if photo.attached?

    avatar_url = "https://api.adorable.io/avatars/285/#{id}projecttracker.png"
    avatar = URI.open(avatar_url)
    photo.attach(io: avatar, filename: "#{username}.png", content_type: 'image/png')
  end
end
