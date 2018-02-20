class Pet

  attr_accessor :id, :name, :colour

  def save

  conn = Pet.open_connection

  if(!self.id)
    sql = "INSERT INTO pets (name, colour) VALUES ( '#{self.name}', '#{self.colour}')"
  else
    sql = "UPDATE pets SET name='#{self.name}', colour='#{self.colour}' WHERE id = #{self.id}"
  end

  conn.exec(sql)

end


  def self.open_connection

    conn = PG.connect( dbname: "mockaroo" )

  end

  def self.all

    conn = self.open_connection

    sql = "SELECT * FROM pets ORDER BY id"

    results = conn.exec(sql)

    pets = results.map do |tuple|
      self.hydrate tuple
    end

    pets

  end

  def self.find id

      conn = self.open_connection

      sql = "SELECT * FROM pets WHERE id = #{id} LIMIT 1"


      pets = conn.exec(sql)

      pet = self.hydrate pets[0]

      pet

end

def self.destroy id

  conn = self.open_connection

  sql = "DELETE FROM pets where id = #{id}"

  conn.exec(sql)

end

  def self.hydrate pet_data

  pet = Pet.new

  pet.id = pet_data['id']
  pet.name = pet_data['name']
  pet.colour = pet_data['colour']


  pet

end

end
