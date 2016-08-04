class Artist
  attr_accessor :name
  @@all = []

def initialize(name)
  @name = name
  @songs = []
end

def add_song(song)
  @songs << song
  song.artist = self
  song
end

def songs
  @songs
end

def self.all
  @@all.uniq
end

def save
  @@all << self
end

  def self.find_or_create_by_name(name)
     artist_name = self.all.find {|artist| artist.name == name}
     if artist_name == nil
      Artist.new(name)
    else
      artist_name
    end
  end

def print_songs
  @songs.each {|song_object| puts song_object.name }
end

end
