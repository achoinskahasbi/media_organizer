module Media
  class Base

    def initialize(directory)
      @media_directory =  directory
      @file_types = []
    end

    def collection
      Dir.glob("#{@media_directory}/**/*").reject { |file_path| File.directory? file_path }
    end

  end
end
