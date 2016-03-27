require 'rails_helper'

RSpec.describe TicketType, type: :model do
  describe 'validations' do
    it { should belong_to(:event) }
    it { should validate_presence_of(:name)  }
    it { should validate_presence_of(:price)  }
    it { should validate_presence_of(:max_quantity)  }
    it { should validate_uniqueness_of(:name).scoped_to(:event_id) }
  end
end
