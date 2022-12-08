# frozen_string_literal: true

# Model for savin User data
class User < ApplicationRecord
  has_many :hits

  def quota_exceded?
    hit_count_time&.month == Date.today.month && hit_count >= 10_000
  end
end
