require 'open-uri'


Park.delete_all

url= "https://developer.nps.gov/api/v1/parks?limit=500&api_key=#{ENV['NPS_KEY']}"
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

Park.all.each do |park|
  park.latLong.split(',')
end
Park.all.each do |park|
  park.latLong.tr!('latlong:', '')
end

Campsite.delete_all
  url= "https://developer.nps.gov/api/v1/campgrounds?limit=250&api_key=#{ENV['NPS_KEY']}"
  json = open(url).read
  parsed_json = ActiveSupport::JSON.decode(json)
  parsed_json["data"].each do |result|
    result.each do |object|
      if object.first === "regulationsurl"
        @regulationsurl = object.last

        elsif object.first === "weatheroverview"
          @weatheroverview = object.last

        elsif object.first === "campsites"
          @campsites = object.last

        elsif object.first === "accessibility"
          @accessibility = object.last

        elsif object.first === "directionsUrl"
          @directionsUrl = object.last

        elsif object.first === "amenities"
           @amenities = object.last

        elsif object.first === "contacts"
          @contacts = object.last

        elsif object.first === "fees"
          @fees = object.last

        elsif object.first === "images"
          @images = object.last

        elsif object.first === "addresses"
          @addresses = object.last

        elsif object.first === "directionsoverview"
          @directionsoverview = object.last

        elsif object.first === "reservationsurl"
          @reservationsurl = object.last

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

        elsif object.first === "reservationssitesfirstcome"
          @reservationssitesfirstcome = object.last

        elsif object.first === "reservationsdescription"
          @reservationsdescription = object.last

        elsif object.first === "name"
          @name = object.last

      end
    end
      campsite = Campsite.create!({
        regulationsurl: @regulationsurl,
        weatheroverview: @weatheroverview,
        campsites: @campsites,
        accessibility: @accessibility,
        directionsUrl: @directionsUrl,
        amenities: @amenities,
        contacts: @contacts,
        fees: @fees,
        images: @images,
        addresses: @addresses,
        directionsoverview: @directionsoverview,
        reservationsurl: @reservationsurl,
        regulationsoverview: @regulationsoverview,
        latLong: @latLong,
        description: @description,
        reservationssitesreservable: @reservationssitesreservable,
        parkCode: @parkCode,
        reservationssitesfirstcome: @reservationssitesfirstcome,
        reservationsdescription: @reservationsdescription,
        name: @name
        })
      end

      url= "https://developer.nps.gov/api/v1/campgrounds?limit=250&start=251&api_key=#{ENV['NPS_KEY']}"
      json = open(url).read
      parsed_json = ActiveSupport::JSON.decode(json)
      parsed_json["data"].each do |result|
        result.each do |object|
          if object.first === "regulationsurl"
            @regulationsurl = object.last

            elsif object.first === "weatheroverview"
              @weatheroverview = object.last

            elsif object.first === "campsites"
              @campsites = object.last

            elsif object.first === "accessibility"
              @accessibility = object.last

            elsif object.first === "directionsUrl"
              @directionsUrl = object.last

            elsif object.first === "amenities"
               @amenities = object.last

            elsif object.first === "contacts"
              @contacts = object.last

            elsif object.first === "fees"
              @fees = object.last

            elsif object.first === "images"
              @images = object.last

            elsif object.first === "addresses"
              @addresses = object.last

            elsif object.first === "directionsoverview"
              @directionsoverview = object.last

            elsif object.first === "reservationsurl"
              @reservationsurl = object.last

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

            elsif object.first === "reservationssitesfirstcome"
              @reservationssitesfirstcome = object.last

            elsif object.first === "reservationsdescription"
              @reservationsdescription = object.last

            elsif object.first === "name"
              @name = object.last

          end
        end
          campsite = Campsite.create!({
            regulationsurl: @regulationsurl,
            weatheroverview: @weatheroverview,
            campsites: @campsites,
            accessibility: @accessibility,
            directionsUrl: @directionsUrl,
            amenities: @amenities,
            contacts: @contacts,
            fees: @fees,
            images: @images,
            addresses: @addresses,
            directionsoverview: @directionsoverview,
            reservationsurl: @reservationsurl,
            regulationsoverview: @regulationsoverview,
            latLong: @latLong,
            description: @description,
            reservationssitesreservable: @reservationssitesreservable,
            parkCode: @parkCode,
            reservationssitesfirstcome: @reservationssitesfirstcome,
            reservationsdescription: @reservationsdescription,
            name: @name
            })
          end


@latlongs = []
@splitp = []
@key_values = ['lat', 'long']
parks = Park.all

parks.each do |park|
   coordinates = park.latLong
  @latlongs.push(Array.new(1,"#{coordinates}"))
  end

  @latlongs.each do |l|
    l.each do |pair|
      @woo = pair.split(',')
      @splitp.push(@woo)
    end
  end

  @splitp.each do |pair|
    pair.each do |p|
      p.tr!('latlong:','')
    end
  end

  @splitp.delete_if { |pair| pair === [] }


Hike.delete_all
@splitp.each do |pair|
url ="https://www.hikingproject.com/data/get-trails?lat=#{pair[0]}&lon=#{pair[1]}&maxDistance=200&key=#{ENV['HIKING_API_KEY']}"

json = open(url).read
parsed_json = ActiveSupport::JSON.decode(json)

        parsed_json["trails"].each do |result|
         result.each do |object|
           if object.first === "name"
             @name = object.last
           elsif object.first === "summary"
             @summary = object.last
           elsif object.first === "difficulty"
             @difficulty = object.last
           elsif object.first === "location"
             @location = object.last
           elsif object.first === "url"
             @url = object.last
           elsif object.first === "imgSqSmall"
             @imgSqSmall= object.last
           elsif object.first === "imgSmall"
             @imgSmall= object.last
           elsif object.first === "imgSmallMed"
             @imgSmallMed= object.last
           elsif object.first === "imgMedium"
             @imgMedium= object.last
           elsif object.first === "length"
             @length= object.last
           elsif object.first === "ascent"
             @ascent= object.last
           elsif object.first === "descent"
             @descent= object.last
           elsif object.first === "high"
             @high= object.last
           elsif object.first === "low"
             @low= object.last
           elsif object.first === "longitude"
             @longitude= object.last
           elsif object.first === "latitude"
             @latitude= object.last
           elsif object.first === "conditionStatus"
             @conditionStatus= object.last
           elsif object.first === "conditionDetails"
             @conditionDetails= object.last
           elsif object.first === "conditionDate"
             @conditionDate= object.last
            end
          end
        end

     hike = Hike.create!({
                     name: @name,
                     summary: @summary,
                     difficulty: @difficulty,
                     location: @location,
                     imgSqSmall: @imgSqSmall,
                     imgSmallMed: @imgSmallMed,
                     imgMedium: @imgMedium,
                     length: @length,
                     ascent: @ascent,
                     descent: @descent,
                     low: @low,
                     latLong: [@latitude, @longitude],
                     conditionStatus: @conditionStatus,
                     conditionDetails: @conditionDetails,
                     conditionDate: @conditionDate

                     })
end
#to run in terminal after seeding
#grouped = Hike.all.group_by { |hike| [hike.name] }
# grouped.values.each do |dup|
#   dup.pop
#   dup.each(&:destroy)
# end
