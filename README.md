# CameraMapSite

Een website om camera's in Utrecht mee te bekijken op een kaart.

## Hoe te runnen
Installeer eerst Julia, aangeraden is om dat te doen door `juliaup` te installeren, zie https://julialang.org/downloads/ voor instructies. Op Linux/Mac is het zo simpel als het runnen van het commando:
```$ curl -fsSL https://install.julialang.org | sh```
Download vervolgens deze repository.

## CLI zoekfunctie
Het zoekscript is te runnen door in de command line te navigeren naar de map van het project (`CameraMapSite`) en daar uit te voeren:
```$ julia --project=. bin/search.jl zoekterm```
Vervang `zoekterm` door de gewenste zoekterm. De flag `--project` moet naar de projectmap wijzen (`.` als je daarin zit) zodat de dependencies uit het project geladen worden en je niet alle dependencies in je algemene environment hoeft te installeren.

## REST API
Om de webserver te starten, navigeer je eerst naar de projectmap en run 
```$ bin/repl```.
Zodra het klaar is met laden, run dan
```julia> up()```
in de Julia-sessie om de server echt te starten. Om te zoeken kun je nu bijvoorbeeld naar de URL `http://localhost/zoek_cameras?naam=zoekterm` gaan, waar je een JSON-bestand krijgt met alle camera's (en hun gegevens) die `zoekterm` in hun naam hebben.

## Site met kaart
Aan de daadwerkelijke site met kaart ben ik helaas niet toe gekomen.
