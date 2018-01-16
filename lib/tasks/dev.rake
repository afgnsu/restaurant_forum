namespace :dev do
  desc "Fake Restaurant"
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do
      Restaurant.create!(
        name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  desc "Fake User"
  task fake_user: :environment do
    20.times do |i|
      User.create!(
        name: "user#{i}",
        email: "user#{i}@mail.com",
        intro: FFaker::Lorem.paragraph,
        password: "12345678"
        )
    end
    puts "have created 20 fake users"
  end

  desc "Fake Comment"
  task fake_comment: :environment do
    Restaurant.all.each do |restaurant|
      3.times do
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.drop(1).sample
          )
      end
    end
    puts "have created 3 fake comments for every restaurant"
    puts "now you have #{Comment.count} comments"
  end

end