FactoryBot.define do
  # SAMPLE JSON PAYLOADS (move into fixtures)
  no_incident_json = "{\"incidents\":[]}"

  one_incident_json = "{\"incidents\":[{\"id\":76603,\"title\":\"Stolen 2015 Giant Escape 1(black)\",\"description\":\"\",\"address\":\"Denver, CO, 80401\",\"occurred_at\":1502690400,\"updated_at\":1585438084,\"url\":\"https:\/\/bikewise.org\/api\/v1\/incidents\/76603\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https:\/\/bikeindex.org\/bikes\/355812\",\"api_url\":\"https:\/\/bikeindex.org\/api\/v1\/bikes\/355812\"},\"media\":{\"image_url\":\"https:\/\/files.bikeindex.org\/uploads\/Pu\/95863\/large_IMG_6792.JPG\",\"image_url_thumb\":\"https:\/\/files.bikeindex.org\/uploads\/Pu\/95863\/small_IMG_6792.JPG\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null}]}"

  some_incidents_json = "{\"incidents\":[{\"id\":77993,\"title\":\"Bike trail needs sign\",\"description\":\"Needs to be a sign warning bikers of traffic\",\"address\":\"100 Jefferson County Pkwy Golden, CO 80419, USA\",\"occurred_at\":1505313023,\"updated_at\":1568706684,\"url\":\"https:\/\/bikewise.org\/api\/v1\/incidents\/77993\",\"source\":{\"name\":\"SeeClickFix.com\",\"html_url\":\"https:\/\/seeclickfix.com\/issues\/3702926\",\"api_url\":\"https:\/\/seeclickfix.com\/api\/v2\/issues\/3702926\"},\"media\":{\"image_url\":\"https:\/\/seeclickfix.com\/files\/issue_images\/0087\/1991\/1505312921145.jpg\",\"image_url_thumb\":\"https:\/\/seeclickfix.com\/files\/issue_images\/0087\/1991\/1505312921145_square.jpg\"},\"location_type\":null,\"location_description\":null,\"type\":\"Hazard\",\"type_properties\":null},{\"id\":42230,\"title\":\"Stolen 2013 Rocky Mountain Bicycles Altitude(black and red)\",\"description\":\"Bike was stolen from garage.  Thief broke into backyard and accessed garage from man door behind garage.\",\"address\":\"Golden, CO, 80402\",\"occurred_at\":1417672800,\"updated_at\":1585432602,\"url\":\"https:\/\/bikewise.org\/api\/v1\/incidents\/42230\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https:\/\/bikeindex.org\/bikes\/35426\",\"api_url\":\"https:\/\/bikeindex.org\/api\/v1\/bikes\/35426\"},\"media\":{\"image_url\":null,\"image_url_thumb\":null},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":42229,\"title\":\"Stolen 2009 Rocky Mountain Bicycles Altitude(white and red)\",\"description\":\"Bike was stolen from garage.  Thief broke into backyard and accessed garage from man door behind garage.\",\"address\":\"Golden, CO, 80402\",\"occurred_at\":1417672800,\"updated_at\":1585440766,\"url\":\"https:\/\/bikewise.org\/api\/v1\/incidents\/42229\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https:\/\/bikeindex.org\/bikes\/35422\",\"api_url\":\"https:\/\/bikeindex.org\/api\/v1\/bikes\/35422\"},\"media\":{\"image_url\":null,\"image_url_thumb\":null},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":41588,\"title\":\"The bike lane is not marked as ending as you approach 24th St. The lane needs to be dashed instea...\",\"description\":\"The bike lane is not marked as ending as you approach 24th St. The lane needs to be dashed instead of solid near the intersection and a sign indicate the lane ends is needed. This indicates to those unfamiliar with the area they need to merge left with traffic.\",\"address\":\"2300-2398 Jackson St, Golden, CO 80401, USA\",\"occurred_at\":1286465480,\"updated_at\":1568662356,\"url\":\"https:\/\/bikewise.org\/api\/v1\/incidents\/41588\",\"source\":{\"name\":\"Bikewise.org\",\"html_url\":null,\"api_url\":null},\"media\":{\"image_url\":null,\"image_url_thumb\":null},\"location_type\":\"arterial\",\"location_description\":null,\"type\":\"Hazard\",\"type_properties\":{\"priority_type\":\"high_annoyance\",\"hazard_type\":\"facility\"}},{\"id\":41587,\"title\":\"The light when heading northbound into campus will not trigger for a bicycle. Heading southbound,...\",\"description\":\"The light when heading northbound into campus will not trigger for a bicycle. Heading southbound, leaving campus, it will trigger if I place the bicycle right over the middle line in the sensor loop.\",\"address\":\"1901-1947 Illinois St, Golden, CO 80401, USA\",\"occurred_at\":1286465311,\"updated_at\":1568662355,\"url\":\"https:\/\/bikewise.org\/api\/v1\/incidents\/41587\",\"source\":{\"name\":\"Bikewise.org\",\"html_url\":null,\"api_url\":null},\"media\":{\"image_url\":null,\"image_url_thumb\":null},\"location_type\":\"arterial\",\"location_description\":null,\"type\":\"Hazard\",\"type_properties\":{\"priority_type\":\"normal\",\"hazard_type\":\"signal\"}}]}"

  many_incidents_json = "{\"incidents\":[{\"id\":134054,\"title\":\"Stolen 2019 Santa Cruz Chameleon(brown)\",\"description\":null,\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1609983613,\"updated_at\":1612666869,\"url\":\"https://bikewise.org/api/v1/incidents/134054\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/988008\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/988008\"},\"media\":{\"image_url\":null,\"image_url_thumb\":null},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":127186,\"title\":\"Stolen 2018 Trek Xcalibur 8(black)\",\"description\":\"\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1599976800,\"updated_at\":1603573355,\"url\":\"https://bikewise.org/api/v1/incidents/127186\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/919206\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/919206\"},\"media\":{\"image_url\":null,\"image_url_thumb\":null},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":134272,\"title\":\"Stolen 2016 Orbea occam(orange)\",\"description\":\"\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1597075200,\"updated_at\":1610472390,\"url\":\"https://bikewise.org/api/v1/incidents/134272\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/989745\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/989745\"},\"media\":{\"image_url\":\"https://files.bikeindex.org/uploads/Pu/388213/large_F55D6353-2187-449E-BEF5-B925D76420F3.png\",\"image_url_thumb\":\"https://files.bikeindex.org/uploads/Pu/388213/small_F55D6353-2187-449E-BEF5-B925D76420F3.png\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":123962,\"title\":\"Stolen 2019 Haibike XDURO AllMTN 3.0(silver, gray or bare metal)\",\"description\":\"Theft broke into a bike shed, with two locked doors. Grinded down two security camera's and stole a bunch of bikes from the apartment complex. Security footage shows the guy riding off with one bike on a motorcycle, but he came back to grab the rest. I'm highly confident that this is my bike: https://denver.craigslist.org/bik/d/denver-haibike-xduro-allmtn-30/7174466787.html\\r\\n\\r\\nI was able to find the name/number/email of the seller, and he fits the description of a bike theft.\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1596603600,\"updated_at\":1599847401,\"url\":\"https://bikewise.org/api/v1/incidents/123962\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/835455\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/835455\"},\"media\":{\"image_url\":\"https://files.bikeindex.org/uploads/Pu/306078/large_A0A9FF4B-1E77-44F2-9988-C3C8835A0A4D.jpeg\",\"image_url_thumb\":\"https://files.bikeindex.org/uploads/Pu/306078/small_A0A9FF4B-1E77-44F2-9988-C3C8835A0A4D.jpeg\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":122491,\"title\":\"Stolen 2020 Specialized RockHopper(blue)\",\"description\":\"stolen from behind my apartment\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1595610000,\"updated_at\":1598886199,\"url\":\"https://bikewise.org/api/v1/incidents/122491\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/796036\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/796036\"},\"media\":{\"image_url\":\"https://files.bikeindex.org/uploads/Pu/292584/large_inbound5898213919025973079.jpg\",\"image_url_thumb\":\"https://files.bikeindex.org/uploads/Pu/292584/small_inbound5898213919025973079.jpg\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":120942,\"title\":\"Stolen Santa Cruz Heckler(black)\",\"description\":\"My bike was in the back patio inside the Tulleride Apartment Complex in Lakewood when it was stolen overnight. The metal combo padlock was cut.\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1593932400,\"updated_at\":1597374203,\"url\":\"https://bikewise.org/api/v1/incidents/120942\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/782548\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/782548\"},\"media\":{\"image_url\":\"https://files.bikeindex.org/uploads/Pu/279464/large_341AB292-AFEA-4CFD-8224-B3D2FD86384D.JPG\",\"image_url_thumb\":\"https://files.bikeindex.org/uploads/Pu/279464/small_341AB292-AFEA-4CFD-8224-B3D2FD86384D.JPG\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":117208,\"title\":\"Stolen 2020 Norco Bikes Range C(black and yellow or gold)\",\"description\":\"Person stole bike from my garage\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1590172056,\"updated_at\":1594101803,\"url\":\"https://bikewise.org/api/v1/incidents/117208\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/733044\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/733044\"},\"media\":{\"image_url\":\"https://files.bikeindex.org/uploads/Pu/245653/large_IMG_4282.jpg\",\"image_url_thumb\":\"https://files.bikeindex.org/uploads/Pu/245653/small_IMG_4282.jpg\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":117207,\"title\":\"Stolen 2015 Intense 951(silver, gray or bare metal)\",\"description\":null,\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1589231923,\"updated_at\":1593399805,\"url\":\"https://bikewise.org/api/v1/incidents/117207\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/733055\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/733055\"},\"media\":{\"image_url\":\"https://files.bikeindex.org/uploads/Pu/245658/large_58922380400__BAA5D4D5-B44D-41A7-9EBE-93C727F2EEFE.jpeg\",\"image_url_thumb\":\"https://files.bikeindex.org/uploads/Pu/245658/small_58922380400__BAA5D4D5-B44D-41A7-9EBE-93C727F2EEFE.jpeg\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":117200,\"title\":\"Stolen 2018 Lynskey Fatskey(silver, gray or bare metal)\",\"description\":\"broke into garage and stole bike\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1589227200,\"updated_at\":1593389005,\"url\":\"https://bikewise.org/api/v1/incidents/117200\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/732988\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/732988\"},\"media\":{\"image_url\":\"https://files.bikeindex.org/uploads/Pu/245634/large_fatbike.jpg\",\"image_url_thumb\":\"https://files.bikeindex.org/uploads/Pu/245634/small_fatbike.jpg\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":112366,\"title\":\"Stolen 2020 Trek Top Fuel 9.8(black and silver, gray or bare metal)\",\"description\":\"Car was stolen with bike on the back of the car.  Car was recovered, bike was not.   Bike was not locked onto car rack but owner was very close to car when it was stolen.\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1576969200,\"updated_at\":1585505000,\"url\":\"https://bikewise.org/api/v1/incidents/112366\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/687018\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/687018\"},\"media\":{\"image_url\":\"https://files.bikeindex.org/uploads/Pu/216170/large_Screenshot_20191223-120720_Snapchat.jpg\",\"image_url_thumb\":\"https://files.bikeindex.org/uploads/Pu/216170/small_Screenshot_20191223-120720_Snapchat.jpg\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":104383,\"title\":\"Stolen 2014 Trek Fuel EX 7 29(black)\",\"description\":\"\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1561474800,\"updated_at\":1585438087,\"url\":\"https://bikewise.org/api/v1/incidents/104383\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/636168\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/636168\"},\"media\":{\"image_url\":\"https://bikebook.s3.amazonaws.com/uploads/Fr/111/Asset_146867\",\"image_url_thumb\":\"https://bikebook.s3.amazonaws.com/uploads/Fr/111/small_Asset_146867\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":88419,\"title\":\"Stolen 2017 Specialized Vita(purple)\",\"description\":null,\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1532292032,\"updated_at\":1585433174,\"url\":\"https://bikewise.org/api/v1/incidents/88419\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/403968\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/403968\"},\"media\":{\"image_url\":null,\"image_url_thumb\":null},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":76815,\"title\":\"Stolen 2012 Specialized Carve Comp 29(white)\",\"description\":\"Ripped out of bike rack on top of car. Fork maybe damaged. Thieff does not have front wheel. \",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1503036000,\"updated_at\":1585432189,\"url\":\"https://bikewise.org/api/v1/incidents/76815\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/356793\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/356793\"},\"media\":{\"image_url\":\"https://bikebook.s3.amazonaws.com/uploads/Fr/3574/9047\",\"image_url_thumb\":\"https://bikebook.s3.amazonaws.com/uploads/Fr/3574/small_9047\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":72213,\"title\":\"Stolen 2017 Specialized Roubaix SL4 Comp UDI2(black and white)\",\"description\":\"Bike stolen from inside garage\",\"address\":\"Lakewood, CO, 80228 \",\"occurred_at\":1494568800,\"updated_at\":1585436038,\"url\":\"https://bikewise.org/api/v1/incidents/72213\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/118935\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/118935\"},\"media\":{\"image_url\":null,\"image_url_thumb\":null},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":63841,\"title\":\"Stolen 2010 Ibis Mojo SL(black)\",\"description\":\"Stolen from backyard.\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1473228000,\"updated_at\":1585425315,\"url\":\"https://bikewise.org/api/v1/incidents/63841\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/95315\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/95315\"},\"media\":{\"image_url\":\"https://files.bikeindex.org/uploads/Pu/66077/large_DSCF3762.jpg\",\"image_url_thumb\":\"https://files.bikeindex.org/uploads/Pu/66077/small_DSCF3762.jpg\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":60453,\"title\":\"Stolen 2015 Ibis Mojo HD3(black)\",\"description\":\"Bike was locked to my car's roof rack.  It was stolen from outside my friend's house on the night of June 29th.\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1467266400,\"updated_at\":1585424621,\"url\":\"https://bikewise.org/api/v1/incidents/60453\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/82870\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/82870\"},\"media\":{\"image_url\":null,\"image_url_thumb\":null},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":44906,\"title\":\"Stolen 2006 Rocky Mountain Bicycles Slayer 50 Mountain Bike(silver, gray or bare metal)\",\"description\":\"From Garage\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1428300000,\"updated_at\":1585440815,\"url\":\"https://bikewise.org/api/v1/incidents/44906\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/43259\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/43259\"},\"media\":{\"image_url\":null,\"image_url_thumb\":null},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":9716,\"title\":\"Stolen Boulder Bicycles(silver, gray or bare metal)\",\"description\":\"Ace hardware Reward: $100\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1401170400,\"updated_at\":1585423294,\"url\":\"https://bikewise.org/api/v1/incidents/9716\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/8274\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/8274\"},\"media\":{\"image_url\":null,\"image_url_thumb\":null},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":34399,\"title\":\"Stolen 2011 K2 Zed 3.0(blue)\",\"description\":\"Porch of Appt.\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1346047200,\"updated_at\":1585433436,\"url\":\"https://bikewise.org/api/v1/incidents/34399\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/25486\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/25486\"},\"media\":{\"image_url\":\"https://files.bikeindex.org/uploads/Pu/8838/large_1346112692.jpg\",\"image_url_thumb\":\"https://files.bikeindex.org/uploads/Pu/8838/small_1346112692.jpg\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":22373,\"title\":\"Stolen 2012 Specialized Myka HT(white and green)\",\"description\":\"bike rack at apartment building Reward: 50\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1343368800,\"updated_at\":1585440680,\"url\":\"https://bikewise.org/api/v1/incidents/22373\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/25324\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/25324\"},\"media\":{\"image_url\":\"https://files.bikeindex.org/uploads/Pu/8786/large_1343931679.jpg\",\"image_url_thumb\":\"https://files.bikeindex.org/uploads/Pu/8786/small_1343931679.jpg\"},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null},{\"id\":20162,\"title\":\"Stolen 2011 Jamis Durango(red and white)\",\"description\":\"home Reward: 100\",\"address\":\"Lakewood, CO, 80228\",\"occurred_at\":1313042400,\"updated_at\":1585440621,\"url\":\"https://bikewise.org/api/v1/incidents/20162\",\"source\":{\"name\":\"BikeIndex.org\",\"html_url\":\"https://bikeindex.org/bikes/22774\",\"api_url\":\"https://bikeindex.org/api/v1/bikes/22774\"},\"media\":{\"image_url\":null,\"image_url_thumb\":null},\"location_type\":null,\"location_description\":null,\"type\":\"Theft\",\"type_properties\":null}]}"


  factory :search do
    # default params passed onto BikeWise API are:
      # proximity: params[:zip]
      # proximity_square: 1 (miles?)

    trait :no_incidents do
      params { { zip: 80403 } }
      response_json { no_incident_json }
    end

    trait :one_incident do # 1 Theft
      params { { zip: 80401 }}
      response_json { one_incident_json }
    end

    trait :some_incidents do # 2 Theft, 3 Hazard
      params { { zip: 80402 } }
      response_json { some_incidents_json }
    end

    trait :many_incidents do
      params { { zip: 80228 } } # 21 Thefts
      response_json { many_incidents_json }
    end
  end
end
