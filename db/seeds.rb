# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def seed_users
    user_id = 0
    10.times do 
        User.create(
            username: "test#{user_id}",
            email: "test#{user_id}@test.com",
            password: "123456",
            password_confirmation: "123456"
        )
        user_id = user_id + 1
    end
end


def seed_categories
    group = ["Class", "Hobby", "Team", "Other"]

    group.each do |name|
        Category.create(name: name)
    end
end

def seed_posts
    categories = Category.all
    categories.each do |category|
        5.times do
            Post.create(
                title: Faker::Lorem.sentences[0], 
                content: Faker::Lorem.sentences[0], 
                user_id: rand(1..9), 
                category_id: category.id
            )
        end
    end
end

seed_users
seed_categories
seed_posts