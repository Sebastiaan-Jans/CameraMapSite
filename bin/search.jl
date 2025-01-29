using SQLite
using DataFrames

const db_name = "cameras"

function search_cameras(db::DBInterface.Connection, search_term::AbstractString)
    return DBInterface.execute(db, "SELECT * FROM $db_name WHERE name LIKE '%$search_term%'")
    # TODO: maybe optionally support more advanced search, like regex
end

function (@main)(args)
    if isempty(args)
        # println("No search term was provided. You must provide a search term as an argument to the program.")
        println("Geen zoekterm opgegeven.")
    elseif length(args) > 1
        # println("More than one search term was provided, only one can be given.")
        println("Meer dan 1 zoekterm opgegegeven.")
    end
    search_term = only(args)

    # assumes the script is located in the /bin of the project
    db_path = joinpath(@__DIR__, "..", "db", db_name * ".sqlite")

    db = SQLite.DB(db_path)

    matches = search_cameras(db, search_term) |> DataFrame
    
    if isempty(matches)
        # println("""No matches found for term "$search_term".""")
        println("""Geen camera's gevonden met de zoekterm $(serach_term)""")
    end
    max_name_length = maximum(textwidth.(matches.name))
    header_string = """Num | $(rpad("Camera", max_name_length)) | Breedtegraad | Lengtegraad"""
    println(header_string)
    println("-"^textwidth(header_string))
    for row in eachrow(matches)
        println(
            join([
                row.number,
                rpad(row.name, max_name_length),
                rpad(round(row.latitude; digits = 6), textwidth("Breedtegraad")),
                rpad(round(row.longitude; digits = 6), textwidth("Lengtegraad")),
            ], " | ")
        )
    end

    close(db)
end

# For compatibility with Julia versions below 1.11 which don't have Main.main
@isdefined(var"@main") ? (@main) : exit(main(ARGS))