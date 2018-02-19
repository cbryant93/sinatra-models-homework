class Post

  attr_accessor :id, :first_name, :last_name, :email, :ip_address

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
