require 'rails_helper'

RSpec.describe Item, type: :model do
  belongs_to :user
end
