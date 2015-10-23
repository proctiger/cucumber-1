require_relative 'transaction_queue'
# require_relative 'balance_store'
require_relative 'account'

transaction_queue = TransactionQueue.new
puts "transaction processor ready"
# ?????????????
loop do
	# def read
	# 	next_message_file = Dir['messages/*'].first
	# 	byebug
	# 	return unless next_message_file
	# 	# ??????
	# 	byebug
	# 	yield File.read(next_message_file)
	# 	FileUtils.rm_rf(next_message_file)
	# end

	# ~~~~~~~~~~~~~~ Yield to put new_balance to file
	# yield the block and "message" is File.read(next_message_file) 

	transaction_queue.read do |message|
		# sleep 1
		transaction_amount, number = message.split(/,/)
		account = Account.find_by_number!(number.strip)
		new_balance = account.balance + transaction_amount.to_i
		account.balance = new_balance
		account.save
	end
end