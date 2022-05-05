# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

########  管理者  ############
Admin.create!(
    email: "admin@admin",
    password: "adminadmin"
)

#########  顧客  ############

Customer.create!(
  [
    {
      first_name: "名前",
      last_name: "苗字",
      first_name_kana: "ナマエ",
      last_name_kana: "ミョウジ",
      email: "test1@test1",
      postal_code: "1111111",
      address: "test1県test1市",
      telephone_number: "11111111111",
      is_deleted: true,
      password: "111111",
    },
    {
      first_name: "鈴木",
      last_name: "太郎",
      first_name_kana: "スズキ",
      last_name_kana: "タロウ",
      email: "test2test2@gmail.com",
      postal_code: "2222222",
      address: "愛知県名古屋市2222",
      telephone_number: "22222222222",
      is_deleted: false,
      password: "222222",
    }
  ]
)


##########  ジャンル  ##############
Genre.create!(
  [
    {
      name: "いちご",
      is_active: true,
    },
    {
      name: "りんご",
      is_active: true,
    },
    {
      name: "ぶどう",
      is_active: false,
    }
  ]
)

Item.create!(
  [
    {
      name: "いちごのショートケーキ",
      genre_id: "1",
      introduction: "いちごがたくさん使われたケーキ",
      price: "800",
      is_active: true,
    },
    {
      name: "りんごのタルト",
      genre_id: "2",
      introduction: "りんごが使われたタルト",
      price: "850",
      is_active: true,
    },
    {
      name: "ぶどうパイ",
      genre_id: "3",
      introduction: "ぶどうが練り込まれたパイ",
      price: "1000",
      is_active: false,
    }
  ]
)