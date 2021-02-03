class Song
  attr_accessor :name, :artist_name
  @@all = []
#i had to add a default name to pass first test when no name given
  def initialize(name = 0, artist_name = 0)
    @name = name 
    @artist_name = artist_name
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end 

  def self.new_by_name(name)
    song = self.new(name)
    song
  end 

  def self.create_by_name(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    #same as class example, find is enumerator method 
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #this method is better than if else 
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    #editing:
    #remove mp3, could also use gsub but lol.
    #set array values to equal their value
    file = File.basename(filename, '.mp3')
    file_array = file.split(" - ")
    artist_name = file_array[0]
    song_name = file_array[1]
    #create new song
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    #always have to return the newly constructed object
    song
  end

  def self.create_from_filename(filename)
    file = File.basename(filename, '.mp3')
    file_array = file.split(" - ")
    artist_name = file_array[0]
    song_name = file_array[1]
    #create new song
    song = self.create # only change from .new_from_filename cuz we wanna save it to @all
    song.name = song_name
    song.artist_name = artist_name
    #always have to return the newly constructed object
    song
  end 

  def self.destroy_all
    @@all.clear
  end



end
