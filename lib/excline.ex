defmodule Excline do
  @moduledoc """
  Documentation for Excline.
  """

  @doc """
  Command line example
  $ mix escript.build
  $ ./excline --help

  ## Examples

  """

  def main(args) do # args- all arguments passed fron the command line
    args |> parse_args |> process
  end

  defp parse_args(args) do
    options = OptionParser.parse(args)
    case options do
      {[name: name], _, _} -> [name]
      {[help: true], _, _} -> :help
      _ -> :help
    end
  end

  defp process([name]) do
    IO.puts "Hello, my friend #{name}!"
  end

  defp process(:help) do
    IO.puts """
      Usage:
        ./excline --name [name]

      Options:
        --help Show this help message.

      Description:
        Prints out a greeting message if name provided.
    """
    System.halt(0)
  end
end
