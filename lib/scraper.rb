class TopVacationSpots::Scraper

    BASE_URL = "http://www.tripadvisor.com/TravelersChoice-Destinations-cPopular-g1"
    def self.get_page
        url = BASE_URL
        res = HTTParty.get(url)
    end

    def scrape_dest_index
        
    end

    def make_destination

    end
end