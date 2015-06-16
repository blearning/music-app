# Homepage (Root path)
get '/' do
  erb :index
end

def current_user
  return @user if @user
  if session[:user_id]
    @user = User.find User.find
  end
end

post '/upvotes/:song_id' do
  current_user.upvotes.create! :song_id => params[:song_id]
end