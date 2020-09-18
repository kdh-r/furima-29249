class BuyAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  validates :token, :postal_code, :prefecture_id, :city, :address, :phone_number, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }  # ハイフンを含む7文字
  validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/}, allow_blank: true # ハイフン不要の11桁以内の電話番号
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } # 都道府県が選択されていないといけない

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    UserAddress.create(postal_code: postal_code, prefecture_id: prefecture_id,
                       city: city, address: address, building: building, phone_number: phone_number, buy_id: buy.id)
  end
end
