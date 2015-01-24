module Media
  class Item
    def initialize(item_path)
      @item_path = item_path
      @item = EXIFR::JPEG.new(item_path)
    end

    def path
      @item_path
    end

    def date
      if @item.date_time_original
        return @item.date_time_original
      end
      File.mtime(@item_path)
    end

    def timestamp
      date.to_time.to_i
    end

    def year
      date.year
    end

    def month
      Date::MONTHNAMES[date.month]
    end

    def day
      "%02d" % date.day
    end

    def location
      if gps
        Geocoder.address([@item.gps.latitude, @item.gps.longitude]).split(',').first
      end
    end

    private

    def gps
      @item.gps
    end


  end
end

