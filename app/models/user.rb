class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "blank.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  has_one :requester, dependent: :destroy
  has_one :caregiver, dependent: :destroy
end
