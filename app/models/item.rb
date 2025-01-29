class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true, length: { maximum: 39 }
  validates :item_info, presence: true, length: { maximum: 999 }

  validates :item_price, presence: true,
                         numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  validates :item_category_id, :item_status_id, :item_shipping_fee_id, :item_prefecture_id, :item_scheduled_delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :item_shipping_fee
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery
  has_one_attached :image

  belongs_to :user
  # has_one :purchase

  SHIPPING_OPTIONS = {
    1 => '---',
    2 => '着払い(購入者負担)',
    3 => '送料込み(出品者負担)'
  }

  def display_shipping_fee
    SHIPPING_OPTIONS[item_shipping_fee_id]
  end
end
