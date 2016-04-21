#!/usr/bin/liquidsoap

# Log dir
set("log.file.path","easy-classic.log")

def apply_metadata(m) =
  print(m)
end

radio = mksafe(
  cue_cut(playlist(
    mode = "normal",
    mime_type = "application/x-cue",
    "easy classic.cue"
  ))
)

radio = on_metadata(apply_metadata,radio)

radio = rewrite_metadata([("comment","http://www.francemusique.fr")],radio)

output.icecast(
  %mp3(id3v2=true,bitrate=128,samplerate=44100),
  host = "localhost",
  port = 8000,
  password = "W426UP7035r",
  mount = "easy-classic",
  genre="Musique classique",
  url="http://www.francemusique.fr",
  description="France Musique | webradio Easy Classic",
  radio
)

output.icecast(
  %fdkaac(channels=2, bitrate=192, aot="mpeg4_aac_lc", transmux="adts", afterburner=true),
  host = "localhost",
  port = 8000,
  password = "W426UP7035r",
  mount = "easy-classic-aac",
  genre="Musique classique",
  url="http://www.francemusique.fr",
  description="France Musique | webradio Easy Classic",
  radio
)
