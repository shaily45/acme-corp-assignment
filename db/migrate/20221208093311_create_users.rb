# frozen_string_literal: true

# Creating table users
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, &:timestamps
  end
end
