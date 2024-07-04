FactoryBot.define do
  factory :buy_address do
    post_code  {"123-4567"}
    sender_id  {2}
    city       {"横浜市"}
    street     {"青山1-1-1"}
    building   {"柳ビル103"}
    telephone  {"09012345678"}
    user_id { FactoryBot.create(:user).id }
    item_id { FactoryBot.create(:item).id }

  end
end
