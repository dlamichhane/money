require "spec_helper"

describe 'Comparable' do
  subject {Money.conversion_rates('EUR', {'USD' => 1.11, 'Bitcoin' => 0.0047})}
  
  before do 
    @fifty_euro = Money.new(50, 'EUR')
    @twenty_dollars = Money.new(20, 'USD')
  end

  describe '#==' do
    it 'should return true of same currency and equal amount' do
      (@twenty_dollars == Money.new(20, 'USD')).should be true
    end

    it 'should return false of same currency and not equal amount' do
      (@twenty_dollars == Money.new(30, 'USD')).should be false
    end

    it 'should return true of same currency and equal amount' do
      fifty_eur_in_usd = "55.50 USD"
      (@fifty_euro == fifty_eur_in_usd).should be true
    end
  end

  describe '#>' do
    it 'should return true if first amount greater than second amount of same currency' do
      (@twenty_dollars > Money.new(5, 'USD')).should be true
    end
  end

  describe '#<' do
    it 'should return true if first amount greater than second amount of same currency' do
      (@twenty_dollars < @fifty_euro).should be true
    end
  end
  
end