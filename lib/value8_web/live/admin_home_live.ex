defmodule Value8Web.AdminHomeLive do
  alias Value8.Accounts
  use Value8Web, :live_view


  def mount(_params, _session, socket) do
 users = Accounts.list_users() # Fetch users from the database
 {:ok, assign(socket, content: :settings, selected_section: "dashboard", users: users)}
end

  def handle_event("sidebar_clicked", %{"section" => section}, socket) do
    {:noreply, assign(socket, content: String.to_atom(section))}
  end

  def handle_event("select_section", %{"section" => section}, socket) do
    {:noreply, assign(socket, :selected_section, section)}
  end

#    def handle_event("select_section", %{"section" => section}, socket) do
#     {:noreply, assign(socket, :selected_section, section)}
#  end

end
