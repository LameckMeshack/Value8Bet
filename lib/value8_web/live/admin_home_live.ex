defmodule Value8Web.AdminHomeLive do
  alias Value8.Repo
  alias Value8.Accounts
  use Value8Web, :live_view


  def mount(_params, _session, socket) do
 users = Accounts.list_users()
 id= socket.assigns.current_user.id
 current_user = Accounts.get_user!(id) |> Repo.preload([admin: :permissions])
#  check if current user has a permission whose name is superadmin
   is_superadmin = Enum.any?(current_user.admin.permissions, fn permission -> permission.name == "superadmin" end)
 {:ok, assign(socket, content: :settings, selected_section: "dashboard", users: users, user_id: nil, is_superadmin: is_superadmin)}
end

  def handle_event("sidebar_clicked", %{"section" => section}, socket) do
    {:noreply, assign(socket, content: String.to_atom(section))}
  end

  def handle_event("select_section", %{"section" => section,"user_id"=>user_id }, socket) do
    selected_user = Accounts.get_all_user_data(user_id)
    {:noreply, assign(socket, selected_section: section, selected_user: selected_user)}
  end



def handle_event("delete_user", %{"user_id" => user_id}, socket) do
  Accounts.delete_user(user_id)
  users = Accounts.list_users()
  socket =
    socket
    |> assign(:users, users)
     |> assign(:selected_section, "users")
    |> put_flash(:info, "User deleted successfully.")
  {:noreply, socket}
end

def handle_event("update_section", value, socket) do
  {:noreply, assign(socket, selected_section: value)}
end




  def handle_event("make_admin", %{"user_id" => user_id}, socket) do
     user_id = String.to_integer(user_id)
   Accounts.make_admin(user_id)
  users = Accounts.list_users()
  socket =
    socket
    |> assign(:users, users)
    |> assign(:selected_section, "users")
    |> put_flash(:info, "User is now an admin.")
  {:noreply, socket}
end

def handle_event("revoke_admin", %{"user_id" => user_id}, socket) do
  user_id = String.to_integer(user_id)
  Accounts.remove_admin(user_id)
  users = Accounts.list_users()
  socket =
    socket
    |> assign(:users, users)
     |> assign(:selected_section, "users")
    |> put_flash(:info, "User is no longer an admin.")
  {:noreply, socket}
end

end
