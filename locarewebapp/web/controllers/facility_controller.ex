defmodule Locarewebapp.FacilityController do
  use Locarewebapp.Web, :controller

  def index(conn, _params) do
    hospital_list = getlist()
    render conn, "lists.html", hospital_list: hospital_list
  end

  def getlist() do
    lists = ["Chinese Sanitarium","Hope Institute","Andrews Memorial Hospital (private)","Bellevue Hospital (BVH)","Bustamante Hospital for Children (BHC)","Kingston Public Hospital (KPH)","Medical Associates Hospital (private)","el shaddai medical centre Jamaica","National Chest Hospital (NCH)","Nuttall Memorial Hospital (private)","St. Joseph's Hospital","University Hospital of the West Indies (UHWI)","Victoria Jubilee Hospital (VJH)","Heart Institute of the Caribbean","Sir John Golding Rehabilitation Center","Maxfield Park Medical Center","Alexandria Community Hospital","Gynae Associates Hospital (private)","Buff Bay Hospital","Port Antonio Hospital","Princess Margaret Hospital","Chapelton Hospital","May Pen Hospital","Lionel Town Community Hospital","Hargreaves Hospital (Private)","Mandeville Hospital","Percy Junior (Spalding Community) Hospital","St. Ann's Bay Hospital","Linstead Hospital","Spanish Town Hospital","Annotto Bay Hospital","Port Maria Hospital","Noel Holmes Hospital","Black River Hospital","Cornwall Regional Hospital","Montego Bay Hospital(private)","Doctors Hospital","Hospiten Montego Bay(private)","Trinity Mall Medical(private)","Falmouth Hospital (Falmouth"," Jamaica)","Savanna-la Mar Public Hospital","Royale Medical Centre","Noel Holmes"]
  end
end
