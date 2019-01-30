#Codeclan Week 03 Day 03
# Pair Programming available
# Music Collection Exercise
require('pry')
require_relative('../models/albums')
require_relative('../models/artists')

Album.delete_all()
Artist.delete_all()

artist_1 = Artist.new({
  'name' => 'Stevie Wonder'
  })

artist_1.save()

  artist_2 = Artist.new({
    'name' => 'Sandy Fae Codeclan'
    })
artist_2.save()

album1 = Album.new({
  'title' => 'Nae jokes about about coughing',
  'genre' => 'Serious',
  'artist_id' => artist_1.id
  })

  album2 = Album.new({
    'title' => 'Renfrew needs to shut up',
    'genre' => 'Deep Code',
    'artist_id' => artist_1.id
    })

album1.save()
album2.save()

artist_1.name = "Winona and the Bats"
artist_1.update
artist_2.delete

album2.title = "Build a Bridge"
album2.update
album1.delete


Artist.list()
Album.list()
binding.pry
nil
