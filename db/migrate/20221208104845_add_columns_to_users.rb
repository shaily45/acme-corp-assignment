# frozen_string_literal: true

# Adding hit_count to table users
class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :hit_count, :bigint, default: 0
    add_column :users, :hit_count_time, :datetime
  end
end
