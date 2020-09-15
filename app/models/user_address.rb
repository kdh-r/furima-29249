class UserAddress < ApplicationRecord

  belongs_to :buy

  validates :postal_code, :prefecture_id, :city, :address, :phone_number, presence: true
  validates :postal_code, format:{ with: /\A\d{3}[-]\d{4}\z/}
  validates :phone_number, format{ :with /\A\d{10}\z|\A\d{11}\z/}
end
