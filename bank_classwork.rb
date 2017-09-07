# Create a class for Accounts

class Account
	
	attr_accessor :name, :balance
	attr_reader :account

	def initialize(name, account, balance)
		@name = name
		@account = account
		@balance = balance
	end

	def add_funds(amount)
		@balance += amount
	end

	def withdraw_funds(amount)
	# chek if the amount being taken is less than available
		if @balance < amount
			puts "Insufficient Funds! Choose a smaller amount!"
		else 
			@balance -= amount 
		end
	end
end



# This is the menu for the main screen
def main_menu
	puts "\n"
	puts"Welcome to Johnson's Financial Institution!"
	puts "Please make a selection from the menu below:"
	puts "--------------------------------------------"
	puts "1. Create a new account"
	puts "2. View Account Information"
	puts "3. Exit Screen"


	print "Your Selection: "

	option = gets.chomp.to_i

	if option == 1
			create_account
			main_menu
	elsif option == 2
			account_menu
	elsif option == 3
		puts "Thank you for stopping by!"
	else
		puts "Invalid entry! Please choose from the available options!"
		main_menu
	end
end



def create_account
	puts "\n"
	puts "Let's get started"
	print "Please enter your name:"
	name = gets.chomp.upcase
	print "Enter a starting balance:"
	balance = gets.chomp.to_f
	acct_num = @accounts.length + 1 
	new_account = Account.new(name, acct_num, balance)
	@accounts.push(new_account)
	
	@accounts.each do |a|
		if a.name == name && a.account == acct_num #checks to see if account is found
			puts "Congratulations, you're account has been created!"
			puts "Name: #{name}"
			puts "Account No.: #{acct_num}"
			puts "Balance: #{balance}"
			puts "Please make a note of this information."
		end
	end
end


def account_menu
	balance = 0
	found = false
	puts "\n"
	puts "Welcome to the Account Menu. Please log in."
	print "Name:  "
	name = gets.chomp.upcase
	print "Account Number:"
	acct_num = gets.chomp.to_i

	@accounts.each do |a|
		if a.name == name && a.account == acct_num
			balance = a.balance
			found = true
		end
	end
			
		if found == true	# account is found, move on to view_account 
			view_account(name, acct_num,balance)
		elsif @count < 2 #otherwise, user has 3 chances to login (I know it says 2 but we're including 0)
			@count +=1 
			puts "Account not found, please try again"
			puts "Attempts left #{3 - @count}!"
			account_menu
		else
			puts "Sorry, account not found. Please contact Customer Service."
			main_menu
		end
end

def view_account(name, acct_num,balance)

	puts "\n"
	puts "Welcome to Your Account #{name}!"
	puts "What would you like to do?"
	puts "---------------------------"
	puts "1. View Account Balance"
	puts "2. Make A Deposit"
	puts "3. Make A Withdrawl"
	puts "4. Back to Main Menu"

	choice = gets.chomp.to_i

	if choice == 1
		view_balance(name,acct_num,balance)
	elsif choice == 2
		make_deposit(name,acct_num)
	elsif choice == 3
		make_withdrawl(name,acct_num)
	elsif choice == 4
		main_menu
		else
		puts "Invalid entry! Please choose from available options!"
		view_account(name, acct_num,balance)
		end
	end


def view_balance(name,acct_num,balance)
	puts "Your currenty balance for account number #{acct_num} is $#{balance}."
	view_account(name,acct_num,balance)
end

def make_deposit(name,acct_num)
	balance = 0
	puts "How much would you like to deposit?"
	amount = gets.chomp.to_f
	
	@accounts.each do |a|
		if a.name == name && a.account == acct_num
				a.add_funds(amount)
				balance = a.balance
				puts "Your deposit of $#{amount} has been made. Your new balance is $#{a.balance}."

			end
		end
		view_account(name,acct_num,balance)
end


def make_withdrawl(name,acct_num)
	balance = 0
	puts "How much would you like to withdraw?"
	amount = gets.chomp.to_f

	@accounts.each do |a|
		if a.name == name && a.account == acct_num
			a.withdraw_funds(amount)
			balance = a.balance
			puts "Your withdrawl of $#{amount} has been made. Your new balance is $#{balance}."
		end
	end
	view_account(name,acct_num,balance)
end




# -----------------Main Program-------------------------------------
@count = 0
@accounts = []

system("clear")

main_menu














