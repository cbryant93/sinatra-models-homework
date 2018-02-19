class Post

  attr_accessor :id, :first_name, :last_name, :email, :ip_address

  def self.open_connection

    conn = PG.connect( dbname: "mockaroo" )

  end

  def self.all

    conn = self.open_connection

    sql = "SELECT id, title, body FROM post ORDER BY id"

    results = conn.exec(sql)

    posts = results.map do |tuple|
      self.hydrate tuple
    end

  posts

  end




end
