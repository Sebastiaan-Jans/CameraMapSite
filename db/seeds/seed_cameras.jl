using CSV
using DataFrames
using SearchLight
using CameraMapSite.Cameras

Base.convert(::Type{<:AbstractString}, _::Missing) = ""
Base.convert(::Type{<:Integer}, _::Missing) = 0
Base.convert(::Type{<:AbstractFloat}, _::Missing) = 0
Base.convert(::Type{<:Integer}, s::String) = parse(Int, s)Base

function seed()
    # for row in CSV.Rows(joinpath(@__DIR__, "cameras-defb.csv"))
    #     println(row)
    # end
    # show(CSV.File(joinpath(@__DIR__, "cameras-defb.csv")))
    cameras = CSV.read(joinpath(@__DIR__, "cameras-defb.csv"), DataFrame) |> dropmissing
    numbers = [parse(Int, replace(name, r"\D" => "")) for name in cameras.Camera]
    insertcols!(cameras, :Number => numbers)

    for row in eachrow(cameras)
        camera = Camera(
            name = row.Camera,
            number = row.Number,
            latitude = row.Latitude,
            longitude = row.Longitude,
        )
        println(camera)
        save(camera)
    end
end