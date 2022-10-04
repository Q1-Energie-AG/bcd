defmodule Bcd do
  @moduledoc """
  Documentation for `Bcd`.
  """

  @doc """
    Encodes a given integer in BCD encoding
  """
  @spec encode(integer) :: bitstring
  def encode(value) when is_integer(value) do
    :erlang.list_to_bitstring(for x <- Integer.digits(value), do: <<x::4>>)
  end

  @doc """
    Deocodes a given bitstring in BCD notation to an integer
  """
  @spec decode(bitstring) :: integer
  def decode(bitstring) when is_bitstring(bitstring) do
    Integer.undigits(for <<x::4 <- bitstring>>, do: x)
  end
end
