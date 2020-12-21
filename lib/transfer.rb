class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      true 
    else 
      false 
    end
  end
  
  def execute_transaction
    if @sender.balance > @amount 
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif sender.balance < @amount 
      @status = "rejected"
    end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount * -1)
      @status = "reversed"
    end
  end
  
end
