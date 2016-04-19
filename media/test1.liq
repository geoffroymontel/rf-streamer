#!/usr/bin/liquidsoap
# Log dir
set("log.file.path","test1.log")

output.icecast(
  %vorbis,
  host = "localhost",
  port = 8000,
  password = "W426UP7035r",
  mount = "test1.ogg",
  mksafe(
    playlist(
      "playlist1.xml",
      mime_type = "application/xspf+xml"
    )
  )
)
