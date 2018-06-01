require 'rails_helper'

describe Order, type: :model do
  context 'validations' do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:total_price) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:accessories) }
    it { should have_many(:order_accessories)}
  end
end
