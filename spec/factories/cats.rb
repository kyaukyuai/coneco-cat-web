# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cat do
    site_id 1
    name "MyString"
    description "MyString"
    keyword "MyString"
    link_url "MyString"
    image_url "MyString"
    userid 1
    username "MyString"
    userpic_url "MyString"
    fav_count 1
    like_count 1
    comment_count 1
    posted_at "2016-01-23 18:01:05"
  end
end
