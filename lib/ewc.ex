defmodule Ewc do
  @moduledoc """
  `Ewc` is a new implementation of UNIX `wc` command by Elixir.
  """

  @doc """
  main
  """
  def main(argv) do
    {opt, file_paths, err} = OptionParser.parse argv, aliases: [l: :line, c: :char, w: :word]

    Enum.each(file_paths, fn file_path ->
      case File.read file_path do
        {:ok, body} -> read_body(file_path, body)
        {:error, :enoent} -> IO.puts "File #{file_path} is not found."
      end
    end)
  end

  def read_body(file_path, body \\ '', opt \\ [char: true, line: true, word: true]) do
    if opt[:line] do
      {_, lines} = read_lines(body)
      IO.write "\t#{lines}"
    end

    if opt[:word] do
      {_, words} = read_words(body)
      IO.write "\t#{words}"
    end

    if opt[:char] do
      {_, bytes} = read_bytes(body)
      IO.write "\t#{bytes}"
    end
    IO.puts "\t#{file_path}"
  end

  @doc """
  Count lines
  """
  def read_lines(body \\ '') do
    found = Regex.scan(~r/\n/, body)
    {:ok, Enum.count(found)}
  end

  @doc """
  Count words
  """
  def read_words(body \\ '') do
    found = String.split(body, ~r/[ \n]+/, trim: true)
    {:ok, Enum.count(found)}
  end

  @doc """
  Count byte size
  """
  def read_bytes(body \\ '') do
    {:ok, byte_size(body)}
  end
end
