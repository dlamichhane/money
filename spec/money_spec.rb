require "spec_helper"

describe 'Money' do

  context 'when amount and currency is specified' do
    it 'uses the amount and currency' do
      fifty_euro = Money.new(60, 'USD')
      fifty_euro.amount.should == 60
      fifty_euro.currency.should == 'USD'
    end
  end

  context 'when amount and currency is not specified' do
    it 'uses the amount and default currency' do
      fifty_euro = Money.new(60)
      fifty_euro.amount.should == 60
      fifty_euro.currency.should == 'EUR'
    end
  end

  describe '.conversion_rates' do
    context 'with appropriate exchange rates' do

      it 'should return exchange rates' do
        exchange_rates = Money.conversion_rates('EUR', {'USD' => 1.11, 'Bitcoin' => 0.0047})
        exchange_rates.should == {'EUR' => 1, 'USD' => 1.11, 'Bitcoin' => 0.0047}
      end

      it 'should return Exchange rates not available' do
        exchange_rates = Money.conversion_rates('EUR')
        exchange_rates.should == "Exchange rates not available"
      end

      it 'should return Inappropriate exchange rates when base currency included' do
        exchange_rates = Money.conversion_rates('EUR', {'USD' => 1.11, 'EUR' => 0.0047})
        exchange_rates.should == "Inappropriate exchange rates"
      end
    end
  end

  describe '#inspect' do
    subject(:fifty_euro) { Money.new(50, 'EUR') }
    
    it 'should return amount with currency' do
      subject.inspect.should == '50.00 EUR'
    end
  end

  describe '#convert_to' do    

    it 'should convert EUR to USD currency' do
      fifty_euro = Money.new(50, 'EUR')
      fifty_euro.convert_to('USD').should == '55.50 USD'
    end

    it 'should convert USD to EUR currency' do
      twenty_dollars = Money.new(20, 'USD')
      twenty_dollars.convert_to('EUR').should == '18.02 EUR'
    end

    it 'should not convert USD to USD currency' do
      twenty_dollars = Money.new(20, 'USD')
      twenty_dollars.convert_to('USD').should == '20.00 USD'
    end

    it 'should return without currency precision' do 
      twenty_dollars = Money.new(20.104, 'USD')
      twenty_dollars.convert_to('USD', false).should == 20.104
    end
  end

end



