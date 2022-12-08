# frozen_string_literal: true

# Model for saving Hit of API
class Hit < ApplicationRecord
  belongs_to :user
  scope :count_hits, -> { where('created_at > ?', Time.now.beginning_of_month).count }

  after_create :monthly_hit_count

  def monthly_hit_count
    user.update(hit_count: user.hits.count_hits, hit_count_time: DateTime.now)
  end
end
