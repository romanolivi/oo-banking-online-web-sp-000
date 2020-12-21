class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def both_valid?
    if sender.valid? && receiver.valid?
      true 
    else 
      false 
    end
  end
  
  def execute_transaction
    if sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "completed"
      puts "Transaction already completed"
    else 
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
      puts "Successful transaction of $#{@amount}."
    end
  end
  
end
