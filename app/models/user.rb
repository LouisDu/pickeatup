class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :profile, dependent: :destroy
  has_many :restaurants, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :reviews

  validates :email, uniqueness: true

  after_create :set_profile

  private

    def set_profile
      Profile.create(user: self)
    end

end
