class Report

  def initialize(media_collection_path)
    @media_collection_path = media_collection_path
    @media_collection = []
    @unique_items = []
    @duplicate_items = {}
  end

  def create
    media_collection.each do |item_path|
      item = Media::Item.new(item_path)
      puts item.location
      if item.timestamp
        if !@unique_items.include?(item.timestamp)
          @unique_items.push(item.timestamp) 
        else
          @duplicate_items.store(item.timestamp, item_path)
        end
      end
    end
    puts "Total media items: #{media_collection.length}"
    puts "Unique items: #{@unique_items.length}"
    puts "Dupe items: #{@duplicate_items.length}"
  end

  def duplicates
    @duplicate_items
  end

  private

  def media_collection
    media = Media::Base.new(@media_collection_path)
    @media_collection = media.collection
  end
end
