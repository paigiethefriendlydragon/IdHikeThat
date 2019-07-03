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
      elsif object.first === "parkCode"
        @parkCode = object.last
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
    weatherInfo: @weatherInfo,
    parkCode: @parkCode
    })
  end

Campsite.delete_all
  url= "https://developer.nps.gov/api/v1/campgrounds?limit=250&api_key=#{ENV['NPS_KEY']}"
  json = open(url).read
  parsed_json = ActiveSupport::JSON.decode(json)
  parsed_json["data"].each do |result|
    result.each do |object|
      if object.first === "regulationsurl"
        @regulationsurl = object.last
        elsif object.first === "regulationsurl"
          @regulationsurl = object.last
        elsif object.first === "weatheroverview"
          @weatheroverview = object.last
        elsif object.first === "campsites"
          @campsites = object.last
        elsif object.first === "accessibility"
          @accessibility = object.last
        elsif object.first === "directionsUrl"
          @directionsUrl = object.last
        elsif object.first === "wheelchairaccess"
           @wheelchairaccess = object.last
        elsif object.first === "internetinfo"
          @internetinfo = object.last
        elsif object.first === "rvallowed"
          @rvallowed = object.last
        elsif object.first === "cellphoneinfo"
          @cellphoneinfo = object.last
        elsif object.first === "rvallowed"
          @rvallowed = object.last
        elsif object.first === "firestovepolicy"
          @firestovepolicy = object.last
        elsif object.first === "rvmaxlength"
          @rvmaxlength = object.last
        elsif object.first === "additionalinfo"
          @additionalinfo = object.last
        elsif object.first === "trailermaxlength"
          @trailermaxlength = object.last
        elsif object.first === "adainfo"
          @adainfo = object.last
        elsif object.first === "rvinfo"
          @rvinfo = object.last
        elsif object.first === "accessroads"
          @accessroads = object.last
        elsif object.first === "trailerallowed"
          @trailerallowed = object.last
        elsif object.first === "classifications"
          @classifications = object.last
        elsif object.first === "trailerallowed"
          @trailerallowed = object.last
        elsif object.first === "directionsoverview"
          @directionsoverview = object.last
        elsif object.first === "trailerallowed"
          @trailerallowed = object.last
        elsif object.first === "reservationsurl"
          @reservationsurl = object.last
        elsif object.first === "directionsUrl"
          @directionsUrl = object.last
        elsif object.first === "regulationsoverview"
          @regulationsoverview = object.last
        elsif object.first === "latLong"
          @latLong = object.last
        elsif object.first === "description"
          @description = object.last
        elsif object.first === "reservationssitesreservable"
          @reservationssitesreservable = object.last
        elsif object.first === "parkCode"
          @parkCode = object.last
        elsif object.first === "amenities"
          @amenities = object.last
        elsif object.first === "reservationsdescription"
          @reservationsdescription = object.last

      end
    end

      campsite = Campsite.create!({
        regulationsurl: @regulationsurl,
        weatheroverview: @weatheroverview,
        campsites: @campsites,
        accessibility: @accessibility,
        directionsoverview: @directionsoverview,
        reservationsurl: @reservationsurl,
        directionsUrl: @directionsUrl,
        reservationssitesfirstcome: @reservationssitesfirstcome,
        regulationsoverview: @regulationsoverview,
        latLong: @latLong,
        description: @description,
        reservationssitesreservable: @reservationssitesreservable,
        parkCode: @parkCode,
        amenities: @amenities,
        reservationsdescription: @reservationsdescription
        })
      end

      url= "https://developer.nps.gov/api/v1/campgrounds?limit=250&start=251&api_key=#{ENV['NPS_KEY']}"
      json = open(url).read
      parsed_json = ActiveSupport::JSON.decode(json)
      parsed_json["data"].each do |result|
        result.each do |object|
          if object.first === "regulationsurl"
            @regulationsurl = object.last
            elsif object.first === "regulationsurl"
              @regulationsurl = object.last
            elsif object.first === "weatheroverview"
              @weatheroverview = object.last
            elsif object.first === "campsites"
              @campsites = object.last
            elsif object.first === "accessibility"
              @accessibility = object.last
            elsif object.first === "directionsUrl"
              @directionsUrl = object.last
            elsif object.first === "wheelchairaccess"
               @wheelchairaccess = object.last
            elsif object.first === "internetinfo"
              @internetinfo = object.last
            elsif object.first === "rvallowed"
              @rvallowed = object.last
            elsif object.first === "cellphoneinfo"
              @cellphoneinfo = object.last
            elsif object.first === "rvallowed"
              @rvallowed = object.last
            elsif object.first === "firestovepolicy"
              @firestovepolicy = object.last
            elsif object.first === "rvmaxlength"
              @rvmaxlength = object.last
            elsif object.first === "additionalinfo"
              @additionalinfo = object.last
            elsif object.first === "trailermaxlength"
              @trailermaxlength = object.last
            elsif object.first === "adainfo"
              @adainfo = object.last
            elsif object.first === "rvinfo"
              @rvinfo = object.last
            elsif object.first === "accessroads"
              @accessroads = object.last
            elsif object.first === "trailerallowed"
              @trailerallowed = object.last
            elsif object.first === "classifications"
              @classifications = object.last
            elsif object.first === "trailerallowed"
              @trailerallowed = object.last
            elsif object.first === "directionsoverview"
              @directionsoverview = object.last
            elsif object.first === "trailerallowed"
              @trailerallowed = object.last
            elsif object.first === "reservationsurl"
              @reservationsurl = object.last
            elsif object.first === "directionsUrl"
              @directionsUrl = object.last
            elsif object.first === "regulationsoverview"
              @regulationsoverview = object.last
            elsif object.first === "latLong"
              @latLong = object.last
            elsif object.first === "description"
              @description = object.last
            elsif object.first === "reservationssitesreservable"
              @reservationssitesreservable = object.last
            elsif object.first === "parkCode"
              @parkCode = object.last
            elsif object.first === "amenities"
              @amenities = object.last
            elsif object.first === "reservationsdescription"
              @reservationsdescription = object.last

          end
        end
          campsite = Campsite.create!({
            regulationsurl: @regulationsurl,
            weatheroverview: @weatheroverview,
            campsites: @campsites,
            accessibility: @accessibility,
            directionsoverview: @directionsoverview,
            reservationsurl: @reservationsurl,
            directionsUrl: @directionsUrl,
            reservationssitesfirstcome: @reservationssitesfirstcome,
            regulationsoverview: @regulationsoverview,
            latLong: @latLong,
            description: @description,
            reservationssitesreservable: @reservationssitesreservable,
            parkCode: @parkCode,
            amenities: @amenities,
            reservationsdescription: @reservationsdescription
            })
          end

          url= "https://developer.nps.gov/api/v1/campgrounds?limit=50&start=501&api_key=#{ENV['NPS_KEY']}"
          json = open(url).read
          parsed_json = ActiveSupport::JSON.decode(json)
          parsed_json["data"].each do |result|
            result.each do |object|
              if object.first === "regulationsurl"
                @regulationsurl = object.last
                elsif object.first === "regulationsurl"
                  @regulationsurl = object.last
                elsif object.first === "weatheroverview"
                  @weatheroverview = object.last
                elsif object.first === "campsites"
                  @campsites = object.last
                elsif object.first === "accessibility"
                  @accessibility = object.last
                elsif object.first === "directionsUrl"
                  @directionsUrl = object.last
                elsif object.first === "wheelchairaccess"
                   @wheelchairaccess = object.last
                elsif object.first === "internetinfo"
                  @internetinfo = object.last
                elsif object.first === "rvallowed"
                  @rvallowed = object.last
                elsif object.first === "cellphoneinfo"
                  @cellphoneinfo = object.last
                elsif object.first === "rvallowed"
                  @rvallowed = object.last
                elsif object.first === "firestovepolicy"
                  @firestovepolicy = object.last
                elsif object.first === "rvmaxlength"
                  @rvmaxlength = object.last
                elsif object.first === "additionalinfo"
                  @additionalinfo = object.last
                elsif object.first === "trailermaxlength"
                  @trailermaxlength = object.last
                elsif object.first === "adainfo"
                  @adainfo = object.last
                elsif object.first === "rvinfo"
                  @rvinfo = object.last
                elsif object.first === "accessroads"
                  @accessroads = object.last
                elsif object.first === "trailerallowed"
                  @trailerallowed = object.last
                elsif object.first === "classifications"
                  @classifications = object.last
                elsif object.first === "trailerallowed"
                  @trailerallowed = object.last
                elsif object.first === "directionsoverview"
                  @directionsoverview = object.last
                elsif object.first === "trailerallowed"
                  @trailerallowed = object.last
                elsif object.first === "reservationsurl"
                  @reservationsurl = object.last
                elsif object.first === "directionsUrl"
                  @directionsUrl = object.last
                elsif object.first === "regulationsoverview"
                  @regulationsoverview = object.last
                elsif object.first === "latLong"
                  @latLong = object.last
                elsif object.first === "description"
                  @description = object.last
                elsif object.first === "reservationssitesreservable"
                  @reservationssitesreservable = object.last
                elsif object.first === "parkCode"
                  @parkCode = object.last
                elsif object.first === "amenities"
                  @amenities = object.last
                elsif object.first === "reservationsdescription"
                  @reservationsdescription = object.last
              end
            end

              campsite = Campsite.create!({
                regulationsurl: @regulationsurl,
                weatheroverview: @weatheroverview,
                campsites: @campsites,
                accessibility: @accessibility,
                directionsoverview: @directionsoverview,
                reservationsurl: @reservationsurl,
                directionsUrl: @directionsUrl,
                reservationssitesfirstcome: @reservationssitesfirstcome,
                regulationsoverview: @regulationsoverview,
                latLong: @latLong,
                description: @description,
                reservationssitesreservable: @reservationssitesreservable,
                parkCode: @parkCode,
                amenities: @amenities,
                reservationsdescription: @reservationsdescription
                })
              end
