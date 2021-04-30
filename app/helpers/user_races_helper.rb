module UserRacesHelper

    def display_finish_time(start_time, finish_time)
        t = finish_time - start_time
        Time.at(t).utc.strftime("%H:%M:%S")
    end

end
