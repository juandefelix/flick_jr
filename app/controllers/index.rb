get '/' do
  @albums = Album.all
  erb :index
end



# ====+====== #
# P H O T O S #
# =====+===== #

get '/albums/:album_id' do
  @album = Album.find(params[:album_id].to_i)
  @user_name = @album.user.name
  erb :album
end

get '/photo/:id' do
  @photo = Photo.find(params[:id].to_i)
  erb :photo
end
