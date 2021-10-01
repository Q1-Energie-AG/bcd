defmodule Bcd do
  @moduledoc """
  Documentation for `Bcd`.
  """

  @doc """
    Encodes a given integer in BCD encoding
  """
  @spec encode(integer) :: bitstring
  def encode(value) when is_integer(value) do
    value
    |> Integer.digits()
    |> Enum.map(&to_bitstring/1)
    |> :erlang.list_to_bitstring()
  end

  @doc """
    Deocodes a given bitstring in BCD notation to an integer
  """
  @spec decode(bitstring) :: integer
  def decode(bitstring) when is_bitstring(bitstring) do
    bitstring
    |> decode([])
    |> Integer.undigits()
  end

  @spec to_bitstring(integer) :: bitstring
  defp to_bitstring(digit), do: <<digit::4>>

  @spec decode(bitstring, list(integer)) :: list(integer)
  defp decode(<<>>, acc), do: acc
  defp decode(<<n::size(4), rest::bitstring>>, acc), do: decode(rest, acc ++ [n])
end
