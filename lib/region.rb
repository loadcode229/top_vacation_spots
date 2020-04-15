class TopVacationSpots::Region

    @@all = []
    attr_accessor :destinations, :name, :region_url

    def initialize(region_hash)
        self.create_attributes_from_hash(region_hash)
        self.destinations = []
        self.get_destinations
        self.class.all << self
    end

    #CM
    def self.all
        @@all
    end

    def self.create_from_array(regions_array)
        regions_array.each do |regions_hash|
            TopVacationSpots::Region.new(regions_hash)
        end
    end
    
    def self.get_regions
        TopVacationSpots::Scraper.scrape_regions_array
    end

    #IM
    def add_destinations(destinations_array)
        destinations_array.each do |destination_hash|
            destination = TopVacationSpots::Destination.new(destination_hash)
            self.destinations << destination
            destination.region = self
        end
    end

    def create_attribute_from_array(destinations_array)
        self.destinations = destinations_array
    end

    def create_attributes_from_hash(regions_hash)
        region_hash.each do |key, value|
            self.send(("#{key}="), value)
        end
    end

end