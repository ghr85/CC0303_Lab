#Codeclan Week 03 Day 03
# Pair Programming available
# Music Collection Exercise

#Helper Class to perform a repeated task easily

require('pg') #require postgres interface

class SqlRunner

#def SqlRunner.run

def self.run(sql, values = []) #identical to line above, sql and values will be the only thing changing, use default to capture missing value
  begin # ^ defualt paramter is array as PG gem expects that
  db = PG.connect({ dbname: 'music_collection', host: 'localhost'})
  db.prepare("query", sql) #query is just a  generic name, could be any CRUD action or potato, use our SQL-query
  result = db.exec_prepared("query", values) #we always want to return something even if we don't use it
ensure #if there's an error above this line this next line will always be executed
    db.close() if db !=nil #just in case the db itself doesn't work
  end
  return result
end

end
