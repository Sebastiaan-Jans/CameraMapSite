using Genie.Router

route("/") do
  serve_static_file("welcome.html")
end

route("/zoek_camera", CamerasController.zoek_camera)