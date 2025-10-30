defmodule Exexif.Manufacturer.Panasonic do
  @moduledoc """
  Maker Note
  https://exiftool.org/TagNames/Panasonic.html
  """

  def parse_makernote(<<80, 97, 110, 97, 115, 111, 110, 105, 99, 0, 0, 0>> <> _ = maker_notes)
      when byte_size(maker_notes) > 1000 do
    %{
      lens_serial_number: get_lens_serial_number(maker_notes),
      lens_model: get_lens_model(maker_notes)
    }
  end

  def parse_makernote(_), do: nil

  defp get_lens_serial_number(binary) do
    binary
    |> :binary.part(0x7E8, 16)
    |> to_string()
    |> :binary.replace(<<0>>, <<>>, [:global])
  end

  def get_lens_model(binary) do
    binary
    |> :binary.part(0x7C8, 32)
    |> to_string()
    |> :binary.replace(<<0>>, <<>>, [:global])
  end
end
