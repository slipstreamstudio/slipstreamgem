module Slipstream
  def self.dump
    "mysqldump -u #{self.config['database']['username']} -p#{self.config['database']['password']} -h #{self.config['database']['server']} #{self.config['database']['name']} --log-error=/dev/null"
  end

  def self.import
    "mysql -u root #{self.config['site']['database']} --force"
  end

  def self.tidy
    `echo "UPDATE wp_options set option_value = REPLACE(option_value, '#{self.config['web']['url'].gsub("http://", "")}', '#{self.config['site']['url'].gsub("http://", "")}');" | #{self.import}`
  end

  def self.rsync
    if self.config['files']
      self.config['files'].each do |path|
        puts "Gettings file(s) in #{path}..."
        `rsync -rv #{self.config['web']['user']}@#{self.config['web']['server']}:#{self.config['web']['path']}/#{path} .`
      end
    end
  end
end