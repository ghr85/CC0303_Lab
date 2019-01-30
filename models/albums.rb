#Codeclan Week 03 Day 03
# Pair Programming available
# Music Collection Exercise


require('pg')
require_relative('artists')
require_relative('../db/sql_runner')


class Album

attr_accessor :title, :genre, :artist_id
attr_reader :id

  def initialize(details_hash)
    @id = details_hash['id'].to_i if details_hash['id']
    @title = details_hash['title']
    @genre = details_hash['genre']
    @artist_id = details_hash['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums(
    title,
    genre,
    artist_id)
    VALUES (
      $1, $2, $3
      ) RETURNING id"
      values = [@title,@genre,@artist_id]
      @id = SqlRunner.run(sql,values)[0]['id'].to_i
  end

  def self.list
    sql = "SELECT * from albums"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album)}
  end

  def artists
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_data = results[0]
    return Artist.new(artist_data)

  end
end #class end
