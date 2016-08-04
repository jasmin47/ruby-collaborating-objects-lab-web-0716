require 'pry'

class Song
attr_reader :artist, :name

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end

  def artist=(artist)
    # binding.pry
    @artist = artist
  end
  
  def name
    # binding.pry
    @name
  end

  def artist
    # binding.pry
    @artist
  end

  def self.new_by_filename(filename)
    new_song = self.new(filename)
    new_song.name = (filename.split(" - ")[1])
    new_song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    new_song.artist.save unless new_song.artist.nil?
    new_song.artist.add_song(new_song) unless new_song.artist.nil?
  end
end
