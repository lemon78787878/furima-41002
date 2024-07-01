FactoryBot.define do
  factory :item do
    item         {"てすと"}
    description  {"商品説明"}
    category_id  {2}
    condition_id {2}
    post_cost_id {2}
    sender_id    {2}
    ship_date_id {2}
    price        {3333}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
