require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @address = FactoryBot.build(:)
  end