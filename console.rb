require_relative('models/Bounty')

bounty_1 = Bounty.new({
	'name' => 'Chris Marshall',
	'value' => 5000,
	'danger_level' => 'ermagerdyerderd',
	'last_known_location' => 'Edinburgh'
})

bounty_2 = Bounty.new({
	'name' => 'Darren Kerr',
	'value' => 1200,
	'danger_level' => 'low',
	'last_known_location' => 'Edinburgh'
})

bounty_1.save
bounty_2.save

bounty_1.value = 10000
bounty_1.update

bounty_2.delete

puts Bounty.find(1)