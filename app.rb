require 'sinatra'
require 'tilt/erb'


set :public_folder, 'public'

class CorgBotApp < Sinatra::Base
    get '/' do
        extensions = ['.png', '.jpg', '.jpeg', '.gif']
        images = Dir.entries('public/images').delete_if { |x|
            extension = x[-4, 4]
            !extensions.index(extension)
        }

        corgi = images[rand(images.length)]
        erb :index, :locals => {
            :corgi => corgi
        }
    end
end
