# Wasnt able to find the filepath
$LOAD_PATH << File.dirname(__FILE__)

require 'money/arithmetic'
require 'money/comparable'


class Money
  include Arithmetic
  include Comparable

  @@exchange_rates = {}
  
  attr_accessor :amount, :currency

  class << self
    def conversion_rates(currency = 'EUR', exchange_rates = {})
      return "Exchange rates not available" if exchange_rates.empty?
      # Check if the currency string is included in the exchanged rates
      return "Inappropriate exchange rates" if exchange_rates.keys.include?(currency)
      @@exchange_rates = {"#{currency}" => 1}.merge(exchange_rates)
    end
  end

  def initialize(amount, currency='EUR')
    @amount = amount
    @currency = currency
  end

  def inspect
    "#{currency_precision(self.amount, self.currency)}"
  end

  def convert_to(convert_to_currency, precision=true)
    begin
      converted_amount = nil
      if currency == 'EUR'
        converted_amount = (@@exchange_rates["#{convert_to_currency}"] * amount)
      elsif currency == convert_to_currency
        converted_amount = amount
      else
        converted_amount = (@@exchange_rates["#{convert_to_currency}"] / @@exchange_rates["#{self.currency}"]) * amount
      end
      precision ? currency_precision(converted_amount, convert_to_currency) : converted_amount
    rescue Exception => e
      puts "Caught exception #{e}!"
    end
  end

  def currency_precision(converted_amount, convert_to_currency)
    "#{'%.02f' %converted_amount} " + convert_to_currency
  end
  
end
