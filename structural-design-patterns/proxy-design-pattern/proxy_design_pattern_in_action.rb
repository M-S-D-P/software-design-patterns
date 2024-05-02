# RealSubject - The real object that the proxy represents
class BankAccount
  attr_accessor :balance

  def initialize(balance)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
    puts "Deposited #{amount}. New balance: #{@balance}"
  end

  def withdraw(amount)
    if @balance >= amount
      @balance -= amount
      puts "Withdrawn #{amount}. New balance: #{@balance}"
    else
      puts "Insufficient funds"
    end
  end
end

# Proxy - Acts as a surrogate for the BankAccount object
class BankAccountProxy
  def initialize(real_subject)
    @real_subject = real_subject
  end

  def deposit(amount)
    puts "Proxy: Depositing #{amount}"
    @real_subject.deposit(amount)
  end

  def withdraw(amount)
    puts "Proxy: Withdrawing #{amount}"
    @real_subject.withdraw(amount)
  end
end

# Client code
real_subject = BankAccount.new(100)
proxy = BankAccountProxy.new(real_subject)

proxy.deposit(50)
proxy.withdraw(30)
proxy.withdraw(150) # Insufficient funds


#In this example:

# BankAccount represents the real object with methods to deposit and withdraw money.
# BankAccountProxy acts as a proxy for the BankAccount object, intercepting method calls and controlling access to the real object.
# The client interacts with the BankAccountProxy, which forwards method calls to the real object (BankAccount) when necessary.
# Proxy pattern can be useful in scenarios such as:
#
# Controlling access to the real object (e.g., access control, logging, validation).
# Delaying the creation or initialization of the real object until it's actually needed (lazy initialization).
# Providing a simplified or restricted interface to the real object.