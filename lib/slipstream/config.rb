require 'yaml'

module Slipstream
  def self.config path ="slipstream.yml"
    @config ||= self.load(path)
  end
  
  def self.load path="slipstream.yml"
    if File.exists?(path)
      File.open( path ) do |yf|
        YAML::load( yf ) 
      end
    else
      puts "Ohs nose! No config file :("
    end
  end
end