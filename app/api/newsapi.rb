
    module Newsapi

            
            API_KEY = '837f6aa08b1245a3b1124438f32e70c5'
            BASE_URL ='https://newsapi.org/v2/everything?q=keyword&apiKey=837f6aa08b1245a3b1124438f32e70c5'
            require 'json'
            

            def self.fetch
                response = Faraday.get(BASE_URL, headers: { 'Content-Type' => 'application/json' })
                res = JSON.parse(response.body)

                return res['articles']

                # case response.code
                # when 200
                #     res = JSON.parse(response.body)
                #     @response = JSON.pretty_generate(res)
                #     # render json: @response
                #     return @response
                # when 404
                #     render json: 'iss, !'
                # else
                #     render json: 'better try again next time!'
                # end
            end

    end

