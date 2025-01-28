module Cameras

import SearchLight: AbstractModel, DbId
import Base: @kwdef

export Camera

@kwdef mutable struct Camera <: AbstractModel
  id::DbId = DbId()
end

end
