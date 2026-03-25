local function create_vehicle(hash, pos, heading)
    if request_model(hash) then
        native.vehicle.create_vehicle(hash)
    end
end