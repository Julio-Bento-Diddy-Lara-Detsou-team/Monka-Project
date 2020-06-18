class Customer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :quotes, dependent: :destroy

  def fullname
    "#{first_name} #{last_name.upcase}"
  end
end
