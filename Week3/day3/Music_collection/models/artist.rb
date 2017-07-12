require('pg')
require_relative('../db/music_sql_runner')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
    
  end

  def save
    sql = "INSERT INTO artists (name) VALUES
          ('#{@name}') RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

  def get_albums
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}

  end

  # List all the albums they have by an artist






end

