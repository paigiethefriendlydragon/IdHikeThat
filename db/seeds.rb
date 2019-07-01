require 'open-uri'


Park.delete_all

url= "https://developer.nps.gov/api/v1/parks?stateCode=AK%2CAL%2CAZ%2CAR%2CCA%2CCO%2CCT%2CDE%2CFL%2CGA%2CHI%2CID%2CIL%2CIN%2CIA%2CKS%2CKY%2CLA%2CME%2CMD%2CMA%2CMI%2CMN%2CMS%2CMO%2CMT%2CNE%2CNV%2CNH%2CNJ%2CNM%2CNY%2CNC%2CND%2COH%2COK%2COR%2CPA%2CRI%2CSC%2CSD%2CTN%2CTX%2CUT%2CVT%2CVA%2CWA%2CWV%2CWI%2CWY&limit=461&api_key=#{ENV['NPS_KEY']}"
json = open(url).read
parsed_json = ActiveSupport::JSON.decode(json)

parsed_json["data"].each do |result|
  result.each do |object|
    if object.first === "states"
      @states = object.last
      elsif object.first === "latLong"
        @latLong = object.last
      elsif object.first === "description"
        @description = object.last
      elsif object.first === "designation"
        @designation = object.last

      elsif object.first === "directionsInfo"
        @directionsInfo = object.last

      elsif object.first === "directionsUrl"
        @directionsUrl = object.last

      elsif object.first === "fullName"
         @fullName = object.last

      elsif object.first === "weatherInfo"
        @weatherInfo = object.last
    end
  end
  park = Park.create!({
    state: @states,
    latLong: @latLong,
    description: @description,
    designation: @designation,
    directionsInfo: @directionsInfo,
    directionsUrl: @directionsUrl,
    fullName: @fullName,
    weatherInfo: @weatherInfo
    })
  end
