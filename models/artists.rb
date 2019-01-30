#Codeclan Week 03 Day 03
# Pair Programming available
# Music Collection Exercise


require('pg')
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
      )"
      values = [@name]
      result = SqlRunner.run(sql,values)
      return result
  end

  def self.list
    sql = "SELECT * from artists"]
    artists = SqlRunner.run(sql)
    return artists.map {|artist| Artist.new(artist)}
  end
end
