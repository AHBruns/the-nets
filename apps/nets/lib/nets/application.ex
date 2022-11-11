defmodule Nets.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Nets.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Nets.PubSub},
      # Start Finch
      {Finch, name: Nets.Finch}
      # Start a worker by calling: Nets.Worker.start_link(arg)
      # {Nets.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Nets.Supervisor)
  end
end
