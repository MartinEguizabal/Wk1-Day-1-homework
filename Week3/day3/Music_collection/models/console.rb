require('pry')
require_relative('album.rb')
require_relative('artist.rb')

Album.delete_all
Artist.delete_all



artist1 = Artist.new('name' => 'Queen')

artist2 = Artist.new('name' => 'Guns & Roses')

artist1.save

artist2.save

album1 = Album.new('title' => 'The Works', 'genre' => 'Rock', 'artist_id' => artist1.id)

album2 = Album.new('title' => 'Apetite for Destruction', 'genre' => 'Rock', 'artist_id' => artist2.id)

album1.save

album2.save

# album1.get_artist

binding.pry

nil

