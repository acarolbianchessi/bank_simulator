require_relative 'account.rb'

class Bank
    def initialize
        @accounts = []
    end

    def menu()
        puts '[1] Cadastrar uma nova conta'
        puts '[2] Consultar Saldo'
        puts '[3] Depositar'
        puts '[4] Transferir'
        puts '[5] Sacar'
        puts '[6] Sair'

        print 'Selecione a opção desejada: ' 
    end

    def register()
        puts 'Número da conta'
        number = gets.to_i()
        puts 'Nome do Titular'
        name = gets.chomp()
        puts 'Saldo Atual'
        balance = gets.to_i()

        account = Account.new(number, name, balance)
        @accounts << account
        puts "Conta número #{number}, com titular #{name} cadastrada com sucesso."
        puts "Saldo atual R$#{balance}."
    end

    def withdraw(value, account_number)
       account = @accounts.find{|account| account.number == account_number}
       account.withdraw(value)
    end

    def consult(account_number)
        account = @accounts.find{|account| account.number == account_number}
        account.balance
    end

    def deposit(value, account_number)
        account = @accounts.find{|account| account.number == account_number}
        account.deposit(value)
    end

    def transfer(value, out_account, in_account)
        out_account = @accounts.find{|account| account.number == out_account}
        in_account = @accounts.find{|account| account.number == in_account}
        if (out_account.out_transfer(value, out_account))
            in_account.in_transfer(value, in_account)
        else            
            puts "Não foi possível transferir. Saldo insuficiente" 
        end
    end

end

bank = Bank.new()
bank.menu()
option = gets.to_i()

while (option != 6) do

    if (option == 1)
        bank.register()
    elsif (option == 2)
        print 'Qual conta deseja consultar o saldo? '
        account_number = gets.to_i()
        balance = bank.consult(account_number)
        puts "O saldo da conta é R$#{balance}"
    elsif (option == 3)
        print 'Em qual a conta deseja depositar? '
        account_number = gets.to_i()
        print 'Qual valor? '
        value = gets.to_i()
        bank.deposit(value, account_number)
    elsif (option == 4)
        print 'De qual conta deseja transferir? '
        out_account = gets.to_i()
        print 'Para qual conta deseja transferir? '
        in_account = gets.to_i()
        print 'Qual valor deseja transferir? '
        value = gets.to_i()
        bank.transfer(value, out_account, in_account)
    elsif (option == 5)
        print 'Qual a conta? '
        account_number = gets.to_i()
        print 'Qual valor deseja sacar? '
        value = gets.to_i()
        bank.withdraw(value, account_number)
    elsif (option == 6)
        puts 'Obrigada por utilizar nosso banco!'
    else 
        puts 'Opção Inválida.'
    end
    bank.menu()
    option = gets.to_i()
end

