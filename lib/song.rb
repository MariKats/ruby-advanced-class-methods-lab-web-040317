class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.include?(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song_name = filename.split(".")[0]
    name = song_name.split(/- */)[1]
    artist_name = song_name.split(/ /)[0]
    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song_name = filename.split(".")[0]
    name = song_name.split(/- */)[1]
    artist_name = song_name.split(/ /)[0]
    song = self.create
    song.name = name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
