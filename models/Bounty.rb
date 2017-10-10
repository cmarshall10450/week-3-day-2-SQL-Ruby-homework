require('pg')

class Bounty

	attr_accessor :last_known_location, :name, :value, :danger_level, :id

	def initialize(options)
		@id = options['id'].to_i if options['id']
		@name = options['name']
		@value = options['value']
		@danger_level = options['danger_level']
		@last_known_location = options['last_known_location']
	end

	def save
		db = PG.connect({
			dbname: 'space-cowboys',
			host: 'localhost',
			user: 'postgres',
			password: 'duFfimm0'
		})

		sql = 'INSERT INTO bounties
				(
					name,
					value,
					danger_level,
					last_known_location
				)
				VALUES ($1, $2, $3, $4)
				RETURNING *'

		db.prepare('save', sql)

		values = [@name, @value, @danger_level, @last_known_location]
		@id = db.exec_prepared('save', values)[0]['id'].to_i
		db.close
	end

	def update
		db = PG.connect({
			dbname: 'space-cowboys',
			host: 'localhost',
			user: 'postgres',
			password: 'duFfimm0'
		})

		sql = 'UPDATE bounties
			SET
				(
					name,
					value,
					danger_level,
					last_known_location
				) =
				(
					$1, $2, $3, $4
				)
			WHERE id = $5'
		db.prepare('update', sql)

		values = [@name, @value, @danger_level, @last_known_location, @id]
		db.exec_prepared('update', values)
		db.close
	end

	def delete
		db = PG.connect({
			dbname: 'space-cowboys',
			host: 'localhost',
			user: 'postgres',
			password: 'duFfimm0'
		})

		sql = 'DELETE FROM bounties WHERE id = $1'
		db.prepare('delete', sql)

		values = [@id]
		db.exec_prepared('delete', values)
		db.close
	end

	def self.find(id)
		db = PG.connect({
			dbname: 'space-cowboys',
			host: 'localhost',
			user: 'postgres',
			password: 'duFfimm0'
		})

		sql = 'SELECT * FROM bounties WHERE id = $1'
		db.prepare('find', sql)

		values = [id]
		bounty = db.exec_prepared('find', values)[0]
		db.close
		return bounty
	end

end