require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/cookies'
require './models.rb'
require "json"
# require 'carrierwave/orm/activerecord'
require 'securerandom'

enable :sessions

get '/' do
    # @photo = Photo.find_by(id: 1)
    # logger.info @photo
    erb :index

end

# post "/image/:id", provides: :json do
#     params = JSON.parse request.body.read
#     logger.info params
# end

get "/getimage/:id" do 
    # send_file "./images/test.png"
    send_file "./images/6484eeb1-b29f-47e1-8386-fd9e38c9ca7ctest.png"
end

post "/image/:id" do
    file = @params[:file]
    # file.write(Pathname.new("./images/test.png"))
    photo = file[:tempfile]
    logger.info photo

    logger.info photo.class

    File.open("./images/" + SecureRandom.uuid + "test.png", "wb") do |f|
        f.write(photo.read)
    end
    # logger.info params
    # logger.info file
    # send_file(params)

    # photo = Photo.new(file: file["tempfile"], comment: "test")
    # photo.save
end