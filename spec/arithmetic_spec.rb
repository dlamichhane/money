require "spec_helper"

describe 'Arithmetic' do
  subject {Money.conversion_rates('EUR', {'USD' => 1.11, 'Bitcoin' => 0.0047})}
  
  before do 
    @fifty_euro = Money.new(50, 'EUR')
    @twenty_dollars = Money.new(20, 'USD')
  end

  describe '#+' do
    it 'should add same currency amount' do
      subject
      (@fifty_euro + @fifty_euro).should == '100.00 EUR' 
    end

    it 'should add two different currency amount' do
      subject
      (@fifty_euro + @twenty_dollars).should == '68.02 EUR' 
    end
  end
  
  describe '#-' do
    it 'should substract same currency amount' do
      subject
      (@fifty_euro - @fifty_euro).should == '0.00 EUR' 
    end

    it 'should add substract two different currency amount' do
      subject
      (@fifty_euro - @twenty_dollars).should == '31.98 EUR' 
    end

    it 'should substract USD to EUR currency' do
      subject
      hundred_dollars = Money.new(100, 'USD')
      (hundred_dollars - @fifty_euro).should == "44.50 USD"
    end
  end

  describe '#/' do
    it 'money should be divisible' do
      (@fifty_euro / 2).should == "25.00 EUR" 
    end
  end

  describe '#*' do 
    it 'money should multiplied' do
      (@twenty_dollars * 2).should == '40.00 USD'
    end
  end
end