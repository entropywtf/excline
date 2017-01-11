defmodule Excline do
  @moduledoc """
  Documentation for Excline.
  """

  @doc """
  Command line example
  $ mix escript.build
  $ ./example --msg=olala

  ## Examples

  """

  def main(args) do # args- all arguments passed fron the command line
    args |> parse_args |> process
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [msg: :string])
    options
  end

  defp process([]) do
    IO.puts "No argumets given"
  end

  defp process(options) do
    IO.puts "Message passed: #{options[:msg]}"
  end
end
