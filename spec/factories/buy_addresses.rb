FactoryBot.define do
  factory :buy_address do
    post_code  {"123-4567"}
    sender_id  {2}
    city       {"横浜市"}
    street     {"青山1-1-1"}
    building   {"柳ビル103"}
    telephone  {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}


  end
end
