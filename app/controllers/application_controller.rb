class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  configure :development do
    set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'hq_dev', pool: 2, username: 'postgres'}
  end

  configure :production do
    set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'hq_prod', pool: 2, username: 'postgres'}
  end

  helpers do
    def base_url
      @base_url ||= "#{request.env['rack.url_scheme']}://{request.env['HTTP_HOST']}"
    end

    def json_params
      begin
    	  JSON.parse(request.body.read)
      rescue
        halt(400, { message:'Invalid JSON' }.to_json)
      end
    end
  end

  current_dir = Dir.pwd
  Dir["#{current_dir}/models/*.rb"].each { |file| require file }

  get '/' do
    "Welcome to the Addressbook!"
  end

  get '/addressbook/person/search/' do
    people = Person.all
    
    [:first_name, :second_name, :address, :phone_number].each do |filter|
      people = people.send(filter, params[filter])	if params[filter]
    end
    if (people.to_json == '[]')
    	p 'RECORD NOT FOUND'
    else
      people.map{ |person| PersonSerializer.new(person) }.to_json
    end 
  end

  get '/addressbook/person/:id' do |id|
    person = Person.where(id: id).first
    halt(404, { message: 'Record Not Found' }.to_json) unless person
    PersonSerializer.new(person).to_json
  end

  post '/addressbook/person' do
    person = Person.new(json_params)
    if person.save
      response.headers['Location'] = "#{base_url}/addressbook/person/#{person.id}"
      status 201
    else
    	status 422
    	body(PersonSerializer.new(person).to_json)
    end
  end
end
