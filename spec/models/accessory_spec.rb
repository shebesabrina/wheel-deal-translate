require 'rails_helper'

describe Accessory, type: :model do
  context 'validations' do
    xit { should validate_presence_of(:txitle) }
    xit { should validate_presence_of(:description) }
    xit { should validate_presence_of(:thumbtail) }
    xit { should validate_presence_of(:price) }
  end
end
