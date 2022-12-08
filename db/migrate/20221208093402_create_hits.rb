# frozen_string_literal: true

# Creating table hits
class CreateHits < ActiveRecord::Migration[5.2]
  def change
    create_table :hits do |t|
      t.integer :user_id
      t.string :endpoint, null: false

      t.timestamps
    end
  end
end
