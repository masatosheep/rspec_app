FactoryBot.define do
  factory :food_enquete do; end

  # 修正前：factory :food_enquete do
  # 修正後：
  factory :food_enquete_tanaka, class: 'FoodEnquete' do
    name { '田中 太郎' }
    mail { 'tanaka@example.com' }
    age { 25 }
    food_id { 2 }
    score { 3 }
    request { 'おいしかったです。' }
    present_id { 1 }
  end

  factory :food_enquete_yamada, class: 'FoodEnquete' do
    name { '山田 次郎' }
    mail { 'yamada@example.com' }
    age { 22 }
    food_id { 1 }
    score { 2 }
    request { '' }
    present_id { 0 }
  end

  factory :food_enquete_sato, class: 'FoodEnquete' do
    name { '佐藤 仁美' }
    mail { 'sato@example.com' }
    age { 19 }
    food_id { 2 }
    score { 3 }
    request { 'おいしかったです。' }
    present_id { 1 }
  end
end
