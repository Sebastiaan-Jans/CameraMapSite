module Cameras

import SearchLight: AbstractModel, DbId
import Base: @kwdef

export Camera

@kwdef mutable struct Camera <: AbstractModel
  id::DbId = DbId()
  name::String = ""
  number::Int = 0
  latitude::Float64 = 0
  longitude::Float64 = 0
end

end
