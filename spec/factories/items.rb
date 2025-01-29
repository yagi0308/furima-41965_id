FactoryBot.define do
  factory :item do
    association :user
    item_name { Faker::Commerce.product_name }
    item_info { Faker::Lorem.paragraph }
    item_category_id { 11 }
    item_status_id { 7 }
    item_shipping_fee_id { 3 }
    item_prefecture_id { 48 }
    item_scheduled_delivery_id { 4 }
    item_price { Faker::Number.between(from: 300, to: 9_999_999) }
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'sample_image.jpg')),
                        filename: 'sample_image.jpg', content_type: 'image/jpeg')
    end
  end
end
