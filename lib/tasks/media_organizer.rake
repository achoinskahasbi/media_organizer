require 'exifr'
require 'geokit'
require 'geocoder'

require '../media_organizer/lib/media_organizer/report.rb'
require '../media_organizer/lib/media_organizer/organizer.rb'
require '../media_organizer/lib/media_organizer/media/base.rb'
require '../media_organizer/lib/media_organizer/media/item.rb'

#require "FileUtils"

namespace :media_collection_organizer do
  desc "Create duplicate report"
  task :report do
    report = Report.new("/Users/achoinska-hasbi/sundbox/media_organizer/media")
    report.create

    puts report.duplicates
    ### Locate duplicates
  end

  desc "Reorganizes media_collection files"
  task :run do

    organizer = Organizer.new("/Users/achoinska-hasbi/sundbox/media_organizer/media")
    organizer.run

  end
end
