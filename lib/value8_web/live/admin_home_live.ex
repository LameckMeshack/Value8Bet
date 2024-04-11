defmodule Value8Web.AdminHomeLive do
  alias Value8.Accounts
  use Value8Web, :live_view


  def mount(_params, _session, socket) do
 users = Accounts.list_users() # Fetch users from the database
 {:ok, assign(socket, content: :settings, selected_section: "dashboard", users: users, user_id: nil)}
end

  def handle_event("sidebar_clicked", %{"section" => section}, socket) do
    {:noreply, assign(socket, content: String.to_atom(section))}
  end

  def handle_event("select_section", %{"section" => section,"user_id"=>user_id }, socket) do
    selected_user = Accounts.get_all_user_data(user_id)
    {:noreply, assign(socket, selected_section: section, selected_user: selected_user)}
  end

# def handle_event("select_section", %{"section" => "view_user", "user_id" => user_id}, socket) do
#   selected_user = Accounts.get_user!(user_id)
#   {:noreply, assign(socket, selected_user: selected_user)}
# end

end
