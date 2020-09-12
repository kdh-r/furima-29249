class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :delivery_time



  belongs_to :user
  has_one :buy
  has_one_attached :image


  validates :name, :text, :category_id, :status_id, :postage_type_id, :ship_from_id, :delivery_time_id, :price, presence: true
  validates :category_id, :status_id, :postage_type_id, :ship_from_id, :delivery_time_id, numericality: { other_than: 1 }
  # validates :price, format:{ with:
end
