class Calculate

  def initialize(params) 
    @num1 = params[:num1]
    @num2 = params[:num2]
    @type_operation = params[:type_operation]
  end

  def results
    send("#{type_operation}")
  end

  private

  attr_reader :num1, :num2, :type_operation

  def summ
    num1 * num2
  end

  def diff 
    num1 - num2
  end
  

end