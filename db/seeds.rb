# ユーザー
User.create!(
  [
    {
      name:  "山田 良子",
      email: "yamada@example.com",
      password:              "foobar",
      password_confirmation: "foobar",
      admin: true
    },
    {
      name:  "鈴木 恵子",
      email: "suzuki@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "採用 太郎",
      email: "recruit@example.com",
      password:              "password",
      password_confirmation: "password",
    },
  ]
)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end






# 料理
description1 = "冬に食べたくなる、身体が温まる料理です。"
description2 = "栄養バランスが良いオススメ料理です。"
description3 = "スピード重視の簡単料理！"


Dish.create!(
  [
    {
      name: "肉じゃが",
      user_id: 1,
      description: description1,
    },
    {
      name: "ソーセージと卵の炒め物",
      user_id: 1,
      description: description2,
    },
    {
      name: "かに玉",
      user_id: 2,
      description: description3,
    },
  ]
)