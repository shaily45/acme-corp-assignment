# frozen_string_literal: true

# File for common code related to Models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
