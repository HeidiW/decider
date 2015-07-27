class ShowsController < ApplicationController

  def search
  end

  def results
    @genre = params[:genre]
    start_time = params[:start_date_time]
    end_time = params[:end_date_time]
    @results = Show.search_by_genre(@genre, start_time, end_time).map do |show|
      title = show["program"]["title"]
      genre = show["program"]["genres"].join(", ")
      desc = show["program"]["short_description"]
      start = Time.parse(show["start_time"])
      duration = show["duration"]
      network = show["station"]["call_sign"]
      Show.new(
               title: title,
               description: desc,
               genre: genre,
               network: network,
               airtime: start,
               duration: duration

              )
    end
  end

  def save
    # I don't know what ShowsController.tms_lookup does or where to find this method.
    new_show = ShowsController.tms_lookup(params[:track_id])
    new_show.save
    @current_user.shows << new_show

    redirect_to root_path
  end

  def create
    current_user.shows.create(ActiveSupport::JSON.decode(params[:show]))
    redirect_to current_user
  end

  def destroy
    Show.delete(params[:id])
    redirect_to root_path
  end

end
