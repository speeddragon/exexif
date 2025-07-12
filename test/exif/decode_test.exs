defmodule Exexif.DecodeTest do
  @moduledoc false
  use ExUnit.Case, async: true
  @subject Exexif.Decode

  describe "version" do
    test "Long version (4 digits) in binary" do
      assert @subject.version("0220") == "2.20"
      assert @subject.version("0221") == "2.21"
      assert @subject.version("1221") == "12.21"
    end

    test "Long version (4 digits) in charlist" do
      assert @subject.version('0220') == "2.20"
      assert @subject.version('0221') == "2.21"
      assert @subject.version('1221') == "12.21"
    end

    test "Short version (3 digits) in binary" do
      assert @subject.version("022") == "2.20"
      assert @subject.version("122") == "12.20"
    end

    test "Short version (3 digits) in charlist" do
      assert @subject.version('022') == "2.20"
      assert @subject.version('122') == "12.20"
    end

    test "Integer Version - GIMP modified image" do
      assert @subject.version(220) == "2.20"
      assert @subject.version(221) == "2.21"
    end
  end
end
