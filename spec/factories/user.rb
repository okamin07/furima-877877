FactoryBot.define do

  factory :user do
    nickname              {"おかみん"}
    email                 {"kkk@gmail.com"}
    password              {"00000000a"}
    password_confirmation {"00000000a"}
    last_name_kana        {"オカムラ"}
    first_name_kana       {"オケオ"}
    last_name             {"岡村"}
    first_name            {"桶男"}
    birthday              {"1935-07-10"}

  end

end

