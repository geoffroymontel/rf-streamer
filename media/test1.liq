#!/usr/bin/liquidsoap
# Log dir
set("log.file.path","test1.log")

output.icecast(
  %mp3,
  host = "localhost",
  port = 8000,
  password = "W426UP7035r",
  mount = "test1",
  mksafe(
    playlist(
      "playlist1.xml",
      mode="normal",
      mime_type = "application/xspf+xml"
    )
  )
)
