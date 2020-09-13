class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :delivery_time

  # テーブルアソシエーション
  belongs_to :user
  has_one :buy
  has_one_attached :image

  validates :name, :text, :category_id, :status_id, :postage_type_id, :ship_from_id, :delivery_time_id, :price, :image, presence: true
  validates :category_id, :status_id, :postage_type_id, :ship_from_id, :delivery_time_id, numericality: { other_than: 1 }
  validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: {in: 300..9_999_999, message: 'Out of setting range'}
  # validate :image_presence
  # def image_presence
  #   if image.attached?
  #     errors.add(:image, "can't be blank" )
  #   end
  # end

  def was_attached?
    image.attached?
  end
end
