require('pg')
require_relative('../db/music_sql_runner')

class Album

attr_reader :id
attr_accessor :title, :genre

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES
        ('#{@title}', '#{@genre}', #{@artist_id}) RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

  def get_artist
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    artist = SqlRunner.run(sql)[0]
    # binding.pry
    return Artist.new(artist)
   
    # nil
  end

  # Show the artist any album belongs to
  



end