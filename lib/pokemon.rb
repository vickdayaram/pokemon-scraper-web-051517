require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(hash)
    @name = :name
    @type = :type
    @db = :db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT pokemon.id, pokemon.name, pokemon.type FROM pokemon WHERE pokemon.id = #{id}")
    pokemon_arry = pokemon[0]
    pokemon_id = pokemon_arry[0]
    pokemon_name = pokemon_arry[1]
    pokemon_type = pokemon_arry[2]
    poke_hash = {:id => nil, :name => nil, :type => nil, :db => @db}
    new_pokemon = Pokemon.new(poke_hash)
    new_pokemon.id = pokemon_id
    new_pokemon.name = pokemon_name
    new_pokemon.type = pokemon_type
    new_pokemon
  end

end
