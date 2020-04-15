class TopVacationSpots::Scraper

    VACA_URL = "https://www.tripadvisor.com/TravelersChoice-Destinations"

    def self.get_page
        res = HTTParty.get(VACA_URL)
    end

    def scrape_dest_index
    end

    def make_destination

    end
end