class Account

    attr_reader :number, :name
    attr_accessor :balance

    def initialize(number, name, balance)
        @number = number
        @name = name
        @balance = balance
    end

    def withdraw(value)
        if balance >= value
            withdraw = value
            qtd100 = (value/100)
            value -= qtd100*100
            puts "Notas de 100: #{qtd100}"
        
            qtd50 = (value/50)
            value -= qtd50*50
            puts "Notas de 50: #{qtd50}"
            
            qtd20 = (value/20)
            value -= qtd20*20
            puts "Notas de 20: #{qtd20}"
        
            qtd10 = (value/10)
            value -= qtd10*10
            puts "Notas de 10: #{qtd10}"

            @balance -= withdraw

            puts "Saque realizado!"
            puts "O saldo atual da conta é R$#{@balance}"
        else
            puts "Não foi possível sacar. Saldo insuficiente"
        end
    end

    def deposit(value)
        @balance += value
        puts "Depósito Realizado!"
        puts "O saldo atual da conta é R$#{@balance}"
    end

    def out_transfer(value, out_account)
        if balance >= value
            @balance -= value
            return true
        else
            return false
        end   
    end
    
    def in_transfer(value, in_account)
        @balance += value
        puts "Transferência realizada com sucesso!"
    end

   
end

