#!/usr/bin/liquidsoap
# Log dir
set("log.file.path","easy classic.log")

def apply_metadata(m) =
  print(m)
end

radio = mksafe(
  playlist(
    mode = "normal",
    mime_type = "application/x-cue",
    "easy-classic.cue"
  )
)

radio = on_metadata(apply_metadata,radio)

output.icecast(
  %mp3,
  host = "localhost",
  port = 8000,
  password = "W426UP7035r",
  mount = "easy-classic",
  radio
)
