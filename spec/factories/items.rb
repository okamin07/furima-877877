FactoryBot.define do
  factory :item do
    name                  {"おかみん箱"}
    details               {"大量のみかんが入っていました"}
    category_id           {1}
    status_id             {1}
    delivery_fee_id       {1}
    shiping_address_id    {1}
    shiping_date_id       {1}
    price                 {4000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('/Users/tech-camp/projects/furima-877877/ER.png'), filename: 'ER.png')
    end
  end
end

