module Slipstream
  def self.update
    puts `ssh #{self.config['web']['user']}@#{self.config['web']['server']} -C "cd #{self.config['web']['path']} && git pull origin master"`
  end
end