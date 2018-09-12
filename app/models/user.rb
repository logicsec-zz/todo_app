class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
        :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :task_lists, foreign_key: :owner_id

  after_create :create_task_list

  def clear_authentication_token!
    update_attribute(:authentication_token, nil)
  end

  def create_task_list
    task_lists.create!(name: "My first list")
  end

  def first_list
    task_lists.first
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.skip_confirmation!
    end
  end

  def self.create_from_google_data(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(email: data["email"],
        password: password, password_confirmation: password
      )
    end
    user
  end
end
