require 'rails_helper'

RSpec.describe Calculate do
  describe '.results' do
    num1 = 5
    num2 = 5

    it "summ operation" do
      params = { num1: num1, num2: num2, type_operation: "summ" }

      results = Calculate.new(params).results

      expect(results).to eq(10) 
    end

    it "diff operation" do
      params = { num1: num1, num2: num2, type_operation: "diff" }

      results = Calculate.new(params).results

      expect(results).to eq(0) 
    end
  end
end