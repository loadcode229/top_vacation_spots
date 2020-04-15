class TopVacationSpots::Scraper

    def get_page
        Nokogiri::HTML(open("https://travel.usnews.com/rankings/best-usa-vacations/"))
    end

    def scrape_dest_index
    end

    def make_destination

    end
end