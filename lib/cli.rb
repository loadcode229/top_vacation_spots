class TopVacationSpots::CLI

    def call
        welcome_screen
        make_regions_and_destinations
        list_regions
    end

    def goodbye
        puts "\n"
        puts "                       The World is your oyster." 
        puts "               Thanks for using Top Travel Destinations!" 
        puts <<-DOC
        _________________________          _____
        |                         \\          \\ * \\__      _____
        |   Safe                   \\__________\\   \\/_______\\___\\_____________
        |   Travels!               /          < /_/   .....................  `-.
        |_________________________/            `-----------,----,--------------'
                                                        _/____/
            
        DOC
        puts "                        Information from TripAdvisor"
        
    end

    def list_destinations(region_index)
        region = TopVacationSpots::Region.all[region_index]
        puts "\n"
        puts "Here are the Top #{region.destinations.count} Travel Destinations For the #{region.name} Region:"
        counter = 1
        region.destination_names.each do |destination|
            puts "#{counter}. #{destination}"
            counter += 1
        end
        select_destination(region_index)
    end

    def list_regions
        puts "\n"
        puts "Here are the Top Vacations Spots of the World:"
        TopVacationSpots::Region.all.each_with_index do |region, index|
            puts "#{index+1}. #{region.name}"
        end
        select_region
    end
    
    def make_regions_and_destinations
        regions_array = TopVacationSpots::Region.get_regions
        TopVacationSpots::Region.create_from_array(regions_array) #Dest instances are instantiated within the Region class, after each region class is instantiated
    end

    def select_destination
        region = TopVacationSpots::Region.all[region_index]
        puts "\n"
        puts "Enter the number of the Top #{region.name} Travel Destination (1-#{region.destinations.count}) for which you would like a description."
        puts "Enter 'destinations' to see the list of #{region.name} destinations again OR 'regions' to go back to the regions OR 'exit'."
        input = gets.strip.downcase
        if input == "regions"
            list_regions
        elsif input == "destinations"
            list_destinations(region_index)
        elsif input == "exit"
            goodbye
        elsif (1..region.destinations.count).to_a.include?(input.to_i)
            destination_index = input.to_i-1
            puts "\n"
            puts "Destination: #{region.destinations[destination_index].name}, Region: #{region.name}"
            puts "\n"
            puts "Summary: #{region.destinations[destination_index].description}"
            select_destination(region_index)
        else
            puts "\n"
            puts "Please input a valid command."
            select_destination
        end
    end

    def select_region
        puts "\n"
        puts "Enter the number of the region (1-#{TopVacationSpots::Region.all.count}) for which you would like the Top Travel Destinations."
        puts "Enter 'regions' to see the regions again OR type 'exit'."
        input = gets.strip.downcase
        if (1..TopVacationSpots::Region.all.count).to_a.include?(input.to_1)
            region_index = input.to_i-1
            list_destinations(region_index)
        elsif input == "regions"
            list_regions
            select_region
        elsif input == "exit"
            goodbye
        else
            puts "\n"
            puts "Please input a valid command."
            select_region
        end
    end

    def welcome_screen
puts "\n"
  puts "Welcome to Top Travel Destinations"
  puts "\n"
  puts "          .-'';'-."
  puts "        ,'   <_,-.`."
  puts "       /)   ,--,_>\\_\\ "
  puts "      |'   (      \\_ |"
  puts "      |_    `-.    / |"
  puts "       \\`-.   ;  _(`/"
  puts "        `.(    \\/ ,'"
  puts "          `-....-'"
    end
end