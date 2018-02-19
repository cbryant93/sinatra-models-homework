class Post

  attr_accessor :id, :first_name, :last_name, :email, :ip_address

  def save

  conn = Post.open_connection

  if(!self.id)
    sql = "INSERT INTO users (first_name , last_name, email, ip_address) VALUES ( '#{self.first_name}', '#{self.last_name}', '#{self.email}', '#{self.ip_address}')"
  else
    sql = "UPDATE users SET first_name='#{self.first_name}', last_name='#{self.last_name}', email='#{self.email}', ip_address='#{self.ip_address}' WHERE id = #{self.id}"
  end

  conn.exec(sql)

end


  def self.open_connection

    conn = PG.connect( dbname: "mockaroo" )

  end

  def self.all

    conn = self.open_connection

    sql = "SELECT * FROM users ORDER BY id"

    results = conn.exec(sql)

    posts = results.map do |tuple|
      self.hydrate tuple
    end

    posts

  end

  def self.find id

      conn = self.open_connection

      sql = "SELECT * FROM post WHERE id = #{id} LIMIT 1"

      # PG always returns an array
      posts = conn.exec(sql)

      # bind just the first and return
      post = self.hydrate posts[0]

      post

end

  def self.hydrate post_data

  post = Post.new

  post.id = post_data['id']
  post.first_name = post_data['first_name']
  post.last_name = post_data['last_name']
  post.email = post_data['email']
  post.ip_address = post_data['ip_address']

  post

end

end
