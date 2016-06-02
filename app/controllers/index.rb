get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @fotos = Photo.all
  erb :index
end

post '/upload' do
  @photo = Photo.new(params[:photo])
  @photo.save!

  redirect '/'
end