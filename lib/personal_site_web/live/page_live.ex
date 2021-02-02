defmodule PersonalSiteWeb.PageLive do
  use PersonalSiteWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, dark: true)}
  end

  @impl true
  def handle_event("toggle_dark", data, socket) do
    value = data |> Map.get("value") |> convert_dark()

    {:noreply, assign(socket, :dark, value)}
  end

  defp convert_dark(val) do
    case val do
      "true" ->
        true

      _ ->
        false
    end
  end
end
