# lib/your_app_web/live/dashboard_live.ex
defmodule Value8Web.DashboardLive do
 use Phoenix.LiveView

 def mount(_params, _session, socket) do
    {:ok, assign(socket, :selected_section, "home")}
 end

 def handle_event("select_section", %{"section" => section}, socket) do
    {:noreply, assign(socket, :selected_section, section)}
 end

#  def render(assigns) do
# ~H"""
# <div>
#   <div class="sidebar">
#     <button phx-click="select_section" phx-value-section="home">Home</button>
#     <button phx-click="select_section" phx-value-section="settings">Settings</button>
#     <button phx-click="select_section" phx-value-section="reports">Reports</button>
#   </div>
#   <div class="main-content">

#       <p>Selected section: <%= @select_section %></p>

#   </div>
# </div>
# """
#  end
end
