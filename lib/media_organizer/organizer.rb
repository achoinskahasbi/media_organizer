class Organizer

  def initialize(media_collection_path)
    @media_collection_path = media_collection_path
    @media_collection = []
    @unique_items = []
  end

  def run
    media_collection.each do |item_path|
      item = Media::Item.new(item_path)
      if item.timestamp
        if !@unique_items.include?(item.timestamp)
          @unique_items.push(item.timestamp)
          move_file(item)
        else
          move_dupe_file(item)
        end
      end
    end
  end

  private

  def destination_dir(item)
    "organized_media_collection/#{item.year}/#{item.month}/#{final_dir(item)}/"
  end

  def dupe_destination_dir(item)
    "dupe_media_collection/#{item.year}/#{item.month}/#{final_dir(item)}/"
  end

  def final_dir(item)
    item.location ? item.location : item.day
  end

  def file_name(item)
    File.basename item.path
  end

  def move_file(item)
    FileUtils.mkdir_p destination_dir(item)
    FileUtils.mv(item.path, "#{destination_dir(item)}/#{file_name(item)}")
  end

  def move_dupe_file(item)
    FileUtils.mkdir_p dupe_destination_dir(item)
    FileUtils.mv(item.path, "#{dupe_destination_dir(item)}/#{file_name(item)}")
  end

  def media_collection
    media = Media::Base.new(@media_collection_path)
    @media_collection = media.collection
  end
end
#File.open("info.txt", 'w') { |file| file.write(info) }
