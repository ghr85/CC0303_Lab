#Codeclan Week 03 Day 03
# Pair Programming available
# Music Collection Exercise
require('pry')
require_relative('../models/albums')
require_relative('../models/artists')


artist_1 = Artist.new({
  "name" => "Stevie Wonder"
  })

artist_1.save()

  artist_2 = Artist.new({
    "name" => "Sandy Fae Codeclan"
    })
artist_2.save()






Artist.list()
Album.list()