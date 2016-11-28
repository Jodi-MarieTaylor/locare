defmodule Locarewebapp.HospitalController do
use Locarewebapp.Web, :controller

def index(conn, _params) do
  hospital_list = getlist()
  render conn, "lists.html", hospital_list: hospital_list
end

def getlist() do
  lists = ["Chinese Sanitarium","Hope Institute","Andrews Memorial Hospital (private)","Bellevue Hospital (BVH)","Bustamante Hospital for Children (BHC)","Kingston Public Hospital (KPH)","Medical Associates Hospital (private)","el shaddai medical centre Jamaica","National Chest Hospital (NCH)","Nuttall Memorial Hospital (private)","St. Joseph's Hospital","University Hospital of the West Indies (UHWI)","Victoria Jubilee Hospital (VJH)","Heart Institute of the Caribbean","Sir John Golding Rehabilitation Center","Maxfield Park Medical Center","Alexandria Community Hospital","Gynae Associates Hospital (private)","Buff Bay Hospital","Port Antonio Hospital","Princess Margaret Hospital","Chapelton Hospital","May Pen Hospital","Lionel Town Community Hospital","Hargreaves Hospital (Private)","Mandeville Hospital","Percy Junior (Spalding Community) Hospital","St. Ann's Bay Hospital","Linstead Hospital","Spanish Town Hospital","Annotto Bay Hospital","Port Maria Hospital","Noel Holmes Hospital","Black River Hospital","Cornwall Regional Hospital","Montego Bay Hospital(private)","Doctors Hospital","Hospiten Montego Bay(private)","Trinity Mall Medical(private)","Falmouth Hospital (Falmouth"," Jamaica)","Savanna-la Mar Public Hospital","Royale Medical Centre","Noel Holmes"]
end

def search(conn, params) do
    IO.inspect params
    Enum.member?(getlist(), params)
    hospital_list = ["#{params["hospital"]}"]
    render conn, "lists.html",  hospital_list: hospital_list

  end

  def nearbyHospital(conn, _params) do

    case HTTPoison.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=hospital&key=AIzaSyDwGPyqtrwD2nxK9ZdBfgihFUEnjwb0_Tk") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        info = Poison.decode!(body)
        results = info["results"] |> List.first()
        name = results["name"]
        photos = results["photos"]
        open_now = results["opening_hours"]["open_now"]
        vicinity= results["vicinity"]
        rating  = results["rating"]


    end
    IO.inspect name
    render conn, "nearby.html" , name: name, photos: photos,vicinity: vicinity, rating: rating, open_now: open_now
  end

  def emergency(conn, _params) do
      render conn, "emergency.html" 
  end
end
