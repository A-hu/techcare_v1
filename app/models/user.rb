class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  before_create :generate_authentication_token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :cell_phone_number, :email

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "blank.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  has_one :requester, dependent: :destroy
  has_one :caregiver, dependent: :destroy

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end

  def full_name
    "#{last_name}#{first_name}"
  end
end
