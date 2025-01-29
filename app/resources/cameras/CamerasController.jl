module CamerasController

using Genie, Genie.Renderer, Genie.Renderer.Json
using SearchLight
using CameraMapSite.Cameras

function zoek_camera()
  println(params(:naam))
  println(length(params(:naam)))
  typeof(params(:naam))
  cameras = find(
    Camera,
    SQLWhereExpression("name LIKE ?", "%$(params(:naam))%")
  )
  return json(Dict("cameras" => cameras))
end

end