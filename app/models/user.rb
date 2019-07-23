class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :books, dependent: :destroy
  has_many :libraries
  has_many :library_additions, through: :libraries, source: :book



  # set per_page globally
  WillPaginate.per_page = 2

  def subscribed?
    stripe_subscription_id?
  end
end
