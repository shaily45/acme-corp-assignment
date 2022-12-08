# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    hit_count { 0 }
    hit_count_time { DateTime.now }
  end
end
