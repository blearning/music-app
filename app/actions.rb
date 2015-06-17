helpers do
  def current_user
    if session[:user_id]
      if @current_user.nil?
        @current_user = User.find(session[:user_id])
      end
      # Can be rewritten as
      # @current_user ||= User.find(session[:user_id])
    end
    @current_user
  end
end

# Homepage (Root path)
get '/' do
  @layout = 'sidebar'
  erb :index
end

get '/add-new' do
  @layout = 'fullwidth'
  erb :'add-music/index'
end

post '/add-new' do
   new_song = Song.new(title: params[:title], author: params[:author], description: params[:description], url: params[:url], users_id: current_user.id)
  if new_song.save
    #do nothing
  else
    @errors = new_song.errors
  end
  redirect "/"
end

get '/sign-up' do
  @layout = 'fullwidth'
  erb :'sign-up/index'
end

post '/sign-up' do
  create_user = User.new(params[:user])
  if create_user.save
    @user = create_user
  else
    @errors = create_user.errors
  end
  erb :'sign-up/index'
end

get '/sign-in' do
  @layout = 'fullwidth'
  erb :'sign-in/index'
end

post '/sign-in' do
  user = User.find_by(email: params[:email])
  # Check that the password entered in the form matches what we have in the database
  if user.password == params[:password]
    # logged in successfully.
    session[:user_id] = user.id
    redirect "/"
  else
    # login failed.
    @message = "Login failed"
    erb :'sign-in/index'
  end
end

get '/sign-out' do
  session[:user_id] = nil
  redirect "/"
end

get '/upvote' do
  if params[:upvote] != nil
    Upvote.create(users_id: current_user.id, songs_id: params[:upvote])
  else
    Upvote.where(songs_id: params[:downvote]).first.destroy if Upvote.where(songs_id: params[:downvote]).count > 0
  end
  redirect "/"
end

# def current_user
#   return @user if @user
#   if session[:user_id]
#     @user = User.find User.find
#   end
# end

# post '/upvotes/:song_id' do
#   current_user.upvotes.create! :song_id => params[:song_id]
# end