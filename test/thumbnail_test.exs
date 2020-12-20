defmodule ThumbnailTest do
  use ExUnit.Case

  @filename "test/images/cactus.jpg"
  @no_exif "test/images/volvo.jpg"
  @thumbname "test/images/cactus-thumb.jpg"

  alias Exexif.Data.Thumbnail
  import Exexif

  test "thumbnail fields are recognized properly" do
    metadata = exif_from_jpeg_file!(@filename)

    Thumbnail.to_image(@filename, metadata.thumbnail)
    assert File.exists?(@thumbname)
    File.rm!(@thumbname)

    assert %Thumbnail{
             thumbnail_offset: 631,
             thumbnail_size: 19_837
           } = metadata.thumbnail
  end

  test "file with incomplete exif" do
    assert %{orientation: "Horizontal (normal)"} == exif_from_jpeg_file!(@no_exif)
  end
end
