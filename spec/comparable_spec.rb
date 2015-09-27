require "spec_helper"

describe 'Comparable' do
  let(:exchange_states) {Money.conversion_rates('EUR', {'USD' => 1.11, 'Bitcoin' => 0.0047})}
  
  before do 
    @fifty_euro = Money.new(50, 'EUR')
    @twenty_dollars = Money.new(20, 'USD')
  end

  describe '#==' do
    it 'should' do
      true
    end
  end
  
end