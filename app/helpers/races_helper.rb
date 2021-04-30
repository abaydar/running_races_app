module RacesHelper

def find_race(id)
    Race.find_by_id(id)
end

end
