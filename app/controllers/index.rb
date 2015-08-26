get '/' do
  # Look in app/views/index.erb
  @links = Link.all
  erb :index
end

post  '/link/shorten' do

  if params[:original_link] =~ URI::regexp
    u = Link.create(original_link: params[:original_link])
    u.shortened_link = "short/#{u.id}"
    u.save

    u.to_json
  else
    error = "Not a url"
    error.to_json
  end
end

get '/:incorrect_url' do
  @incorrect_url = params[:incorrect_url]
  erb :index
end

get '/link/all' do
  @all_link = Link.all

  erb :'link/show_all'
end


get '/short/:id' do
  id = params[:id]
  link = Link.find(id)
  link.visitor_counter += 1
  link.save
  redirect to link.original_link
end