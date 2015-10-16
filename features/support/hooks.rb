# Before do |scenario|
# 	puts "Starting scenario #{scenario.name}"
# end

# After do |scenario|
#   puts "Oh dear" if scenario.failed?
# end

# # "block.call" execute the scenario
# Around do |scenario, block|
# 	puts "About to run #{scenario.name}"
# 	block.call
# end