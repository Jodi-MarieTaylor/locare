defmodule Locarewebapp.PageController do
  use Locarewebapp.Web, :controller

  def index(conn, _params) do
    case HTTPoison.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=hospital&key=AIzaSyDwGPyqtrwD2nxK9ZdBfgihFUEnjwb0_Tk") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        info = Poison.decode!(body)
        results = info["results"] |> List.first()
        name = results["name"]
        photos = results["photos"]
        opening_hours = results["opening_hours"]
        vicinity= results["vicinity"]
        rating  = results["rating"]


    end

    render conn, "index.html" #, name: name, photos: photos, opening_hours: opening_hours, vicinity: vicinity, rating: rating
  end
end
