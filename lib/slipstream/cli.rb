require 'thor'
require 'thor/actions'

module Slipstream
  class CLI < Thor
    include Thor::Actions

    desc 'sync', "Takes the remote database and files and pulls them down"
    def sync
      database
      files
      puts "All done!"
    end
    
    desc 'database', "Database sync"
    def database
      puts "Syncing database.."
      `#{Slipstream.dump} | #{Slipstream.import}`
      puts "Tidying up paths..."
      Slipstream.tidy
    end

    desc 'files', "File sync"
    def files
      Slipstream.rsync
    end
    
    desc 'update', "Update"
    def update
      Slipstream.update
    end
  end
end