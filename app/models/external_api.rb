require 'unirest'
class ExternalApi
    #API.vin_lookup

    def self.vin_lookup(vin="WBAYA6C58DD143543")
        # #url = `https://vinhub.p.rapidapi.com/auction/#{vin}/run`
        # sw = 'https://swapi.dev/api/people/1'
        # res = Unirest.get(sw,
        #     headers:{
        #         "X-RapidAPI-Host" => "vinhub.p.rapidapi.com",
        #
        #         "X-RapidAPI-Key" => '99ede47ed6mshe09f3aac65823b3p11e884jsn559b65dd3197', #TOKEN ???
        #         "X-AUTH-TOKEN" => "96a7cbbc2886caae4f5a51174d5fb0ae"
        #             })


        response = Unirest.get "https://vinhub.p.rapidapi.com/auction/WBAYA6C58DD143543/run",
        headers:{
            "X-RapidAPI-Host" => "vinhub.p.rapidapi.com",
            "X-RapidAPI-Key" => TOKEN#,
            # "X-AUTH-TOKEN" => "96a7cbbc2886caae4f5a51174d5fb0ae"
        }
        # Unirest.get('https://swapi.dev/api/people/1')
        j_res = JSON.parse(response)
        return j_res

    end
end
