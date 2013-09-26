require 'faker'

FactoryGirl.define do
  factory :survey do |f|
    f.title { Faker::Company.catch_phrase }
    f.description { Faker::Company.catch_phrase }
  end

  factory :invalid_survey_title, parent: :survey do |f|
    f.title nil
    f.description { Faker::Company.catch_phrase }
  end

  factory :invalid_survey_desc, parent: :survey do |f|
    f.title { Faker::Company.catch_phrase }
    f.description nil
  end

  factory :question do |f|
    f.title { Faker::Company.catch_phrase }
  end

  factory :invalid_question, parent: :question do |f|
    f.title nil
  end


end
