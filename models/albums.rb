#Codeclan Week 03 Day 03
# Pair Programming available
# Music Collection Exercise


require('pg')
require_relative('../db/sql_runner')


class Album

  def initialize(details_hash)
    @id = details_hash[:id].to_i if details_hash['id']
    @title = details_hash[:title]
    @genre = details_hash[:genre]
    @artist_id = details_hash['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums(
    title,
    genre,
    artist_id)
    VALUES (
      $1, $2, $3
      )"
      values = [@title,@genre,@artist_id]
      result = SqlRunner.run(sql,values)
      return result
  end

  def self.list
    sql = "SELECT * from albums"]
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album)}
  end
end #class end
