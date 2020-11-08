class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
   
    if valid? == true && sender.balance >= amount && self.status == "pending"
       self.status = "complete"
       receiver.balance += amount
       sender.balance -= amount
    else 
       self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" 
         self.status = "reversed" 
         sender.balance += amount
         receiver.balance -= amount
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
       
    end
  end


end
