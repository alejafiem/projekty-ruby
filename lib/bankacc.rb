class BankAccount
  attr_reader :owner

  def initialize(owner)
    @owner = owner
    @transactions = []
    add_transaction("Beginning Balance", 0)
  end

  def credit(description, amount)
    add_transaction(description, amount)
  end

  def debit(description, amount)
    add_transaction(description, -amount)
  end

  def add_transaction(description, amount)
    @transactions.push(description: description, amount: amount)
  end

  def balance
    balance = 0.0
    @transactions.each do |transaction|
      balance += transaction[:amount]
    end
    return balance
  end

  def to_s
    "Name: #{owner.name}, Balance: #{sprintf("%0.2f", balance)}"
  end
end


class Client
  attr_reader :name
  attr_reader :surname
  def initialize(client_id, name, surname)
    @client_id = client_id
    @name = name
    @surname = surname
  end
end

