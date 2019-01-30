#Codeclan Week 03 Day 03
# Pair Programming available
# Music Collection Exercise


require('pg')
require_relative('albums')
require_relative('../db/sql_runner')


class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(details_hash)
    @id = details_hash['id'].to_i if details_hash['id']
    @name = details_hash['name']
  end

  def save
    sql = "INSERT INTO artists(
    name)
    VALUES (
      $1
      ) RETURNING id"
      values = [@name]
      @id = SqlRunner.run(sql,values)[0]['id'].to_i
  end

  def self.list
    sql = "SELECT * from artists"
    artists = SqlRunner.run(sql)
    return artists.map {|artist| Artist.new(artist)}
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map {|album| Album.new(album)}
  end


  
end
