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
      first_name: "太郎",
      last_name: "鈴木",
      first_name_kana: "タロウ",
      last_name_kana: "スズキ",
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
      name: "ケーキ",
      is_active: true,
    },
    {
      name: "焼き菓子",
      is_active: true,
    },
    {
      name: "プリン",
      is_active: true,
    },
    {
      name: "キャンディ",
      is_active: false,
    },
    {
      name: "生菓子",
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
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/cake_strawberry.jpg')),
        filename: 'cake.jpg',
        content_type: 'cake.jpg'
      )
    },
    {
      name: "マカロン",
      genre_id: "2",
      introduction: "カラフルなマカロン",
      price: "850",
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/Macarons.jpg')),
        filename: 'Macarons.jpg',
        content_type: 'Macarons.jpg'
      )
    },
    {
      name: "ドーナツ",
      genre_id: "2",
      introduction: "半分をチョコレートでコーティングしました",
      price: "400",
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/donut_harf_choko.jpg')),
        filename: 'donut_harf_choko.jpg',
        content_type: 'donut_harf_choko.jpg'
      )
    },
    {
      name: "モンブラン",
      genre_id: "1",
      introduction: "栗の甘露煮がたっぷり",
      price: "800",
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/Mont_Blanc.jpg')),
        filename: 'Mont_Blanc.jpg',
        content_type: 'Mont_Blanc.jpg'
      )
    },
    {
      name: "果実ケーキ",
      genre_id: "1",
      introduction: "季節の果物をたっぷり使ったケーキ",
      price: "1000",
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/cake_fruit.jpg')),
        filename: 'cake_fruit.jpg',
        content_type: 'cake_fruit.jpg'
      )
    },
    {
      name: "英語クッキー",
      genre_id: "2",
      introduction: "英語で書かれたクッキー",
      price: "900",
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/cookie_english.jpg')),
        filename: 'cookie_english.jpg',
        content_type: 'cookie_english.jpg'
      )
    },
    {
      name: "イベントクッキー",
      genre_id: "2",
      introduction: "イベントに合わせたクッキー",
      price: "1000",
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/cookie_Xmas.jpg')),
        filename: 'cookie_Xmas.jpg',
        content_type: 'cookie_Xmas.jpg'
      )
    },
    {
      name: "スマイルクッキー",
      genre_id: "2",
      introduction: "笑顔のクッキー",
      price: "1000",
      is_active: false,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/cookie_smile.jpg')),
        filename: 'cookie_smile.jpg',
        content_type: 'cookie_smile.jpg'
      )
    }
  ]
)

Address.create!(
  [
    {
      customer_id: 1,
      name: "111",
      postal_code: "1111111",
      address: "111県111市111町"
    },
    {
      customer_id: 2,
      name: "222",
      postal_code: "2222222",
      address: "22県22市22町"
    },
    {
      customer_id: 2,
      name: "勤務先",
      postal_code: "2222424",
      address: "22県24市2424"
    }
  ]
)

Order.create!(
  [
    {
      customer_id: 1,
      payment_method: 0,
      shipping_cost: 800,
      total_payment: 1600,
      address: "111県111市111町",
      name: "111",
      postal_code: "1111111",
      status: 0
    },
    {
      customer_id: 2,
      payment_method: 0,
      shipping_cost: 800,
      total_payment: 1600,
      address: "22県22市22町",
      name: "222",
      postal_code: "2222222",
      status: 0
    },
    {
      customer_id: 2,
      payment_method: 0,
      shipping_cost: 800,
      total_payment: 1600,
      address: "22県24市2424",
      name: "勤務先",
      postal_code: "2222424",
      status: 0
    }
  ]
)

OrderDetail.create!(
  [
    {
      order_id: 1,
      item_id: 1,
      price: 800,
      amount: 1,
      making_status: 0
    },
    {
      order_id: 1,
      item_id: 2,
      price: 850,
      amount: 1,
      making_status: 0
    },
    {
      order_id: 2,
      item_id: 1,
      price: 800,
      amount: 1,
      making_status: 0
    },
    {
      order_id: 2,
      item_id: 2,
      price: 850,
      amount: 1,
      making_status: 0
    },
    {
      order_id: 3,
      item_id: 1,
      price: 800,
      amount: 1,
      making_status: 0
    },
    {
      order_id: 3,
      item_id: 2,
      price: 850,
      amount: 1,
      making_status: 0
    }
  ]
)