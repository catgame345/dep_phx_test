defmodule DepWeb.OrderLive.Show do
  use DepWeb, :live_view

  alias Dep.Products

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:order, Products.get_order!(id))}
  end

  defp page_title(:show), do: "Show Order"
  defp page_title(:edit), do: "Edit Order"
end
