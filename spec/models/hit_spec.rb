# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hit, type: :model do
  let(:user) { create(:user) }
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  describe 'callbacks' do
    it { is_expected.to callback(:monthly_hit_count).after(:create) }
  end

  describe 'exceed_method' do
    it "Return false If month condition doesn't exceeds" do
      expect(user.quota_exceded?).to eq(false)
    end

    it 'Return true If month condition exceeds' do
      user.update(hit_count: 10_000, hit_count_time: DateTime.now)
      expect(user.quota_exceded?).to eq(true)
    end
  end
end
