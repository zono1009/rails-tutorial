books_count = 20

# テストデータをクリア
Book.destroy_all

# Fakerを使ってランダムなデータを生成
books_count.times do
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    description: Faker::Lorem.paragraph(sentence_count: 3)
  )
end

puts "#{books_count} random books created successfully!"
