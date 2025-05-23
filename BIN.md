# 🛠 Dotfiles Tool Index

Auto-generated list of CLI tools in `bin/` by running each script.

## `convert2m4r`

convert2m4r - Convert MP3/MP4 to iPhone-compatible .m4r ringtone

Usage:
  convert2m4r input.mp3 [title]

Arguments:
  input         Input audio or video file (MP3/MP4)
  title         Optional. Title to embed in metadata. Defaults to filename.

Output:
  Generates a 30-second .m4r ringtone file for use on iPhone.

Example:
  convert2m4r my-audio.mp3 "Morning Tune"

## `convert4tv`

convert4tv - Convert a given URL or file to an MP4 format playable on TV

Usage:
  convert4tv input_url_or_file [output_file]

Arguments:
  input_url_or_file  Input URL or file to convert
  output_file        Optional. Name of the output file (default: output.mp4)

Output:
  Generates an MP4 file compatible with picky TV players.

Example:
  convert4tv http://example.com/video.mp4 my_output.mp4
