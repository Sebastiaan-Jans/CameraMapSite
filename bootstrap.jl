(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using CameraMapSite
const UserApp = CameraMapSite
CameraMapSite.main()
