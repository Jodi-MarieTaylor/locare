defmodule Locarewebapp.Router do
  use Locarewebapp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Locarewebapp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    #get "/medicalfacilites", FacilityController, :index
    get "/hospitals", HospitalController, :index
    get "/hospital/search", HospitalController, :search
    get "/hospital/nearby", HospitalController, :nearbyHospital
    get "/hospital/emergency", HospitalController, :emergency
  end

  # Other scopes may use custom stacks.
  # scope "/api", Locarewebapp do
  #   pipe_through :api
  # end
end
