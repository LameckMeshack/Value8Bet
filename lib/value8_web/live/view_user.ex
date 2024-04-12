defmodule Value8Web.ViewUser do
  alias Value8.Accounts
  use Phoenix.LiveComponent

  def render(assigns) do
    user = assigns[:selected_user]
    is_admin = user.admin != nil
    is_superadmin = assigns[:is_superadmin]
    # is_superadmin = is_admin && Enum.any?(user.admin.permissions, fn p -> p.name == "superadmin" end)
  #  check if current user in superadmin
   ~H"""
    <div class="bg-white shadow overflow-hidden sm:rounded-lg">
      <div class="px-4 py-5 sm:px-6">
        <h3 class="text-lg font-medium leading-6 text-gray-900">User Details </h3>
      </div>
      <div class="border-t border-gray-200">
        <dl>
          <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
            <dt class="text-sm font-medium text-gray-500">Email</dt>
            <dd class="mt-1 text-sm text-gray-900 sm:col-span-2"><%= user.email %></dd>
          </div>
          <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
            <dt class="text-sm font-medium text-gray-500">Phone</dt>
            <dd class="mt-1 text-sm text-gray-900 sm:col-span-2"><%= user.phone %></dd>
          </div>
          <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
            <dt class="text-sm font-medium text-gray-500">First Name</dt>
            <dd class="mt-1 text-sm text-gray-900 sm:col-span-2"><%= user.first_name %></dd>
          </div>
          <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
            <dt class="text-sm font-medium text-gray-500">Last Name</dt>
            <dd class="mt-1 text-sm text-gray-900 sm:col-span-2"><%= user.last_name %></dd>
          </div>


           <!-- Action buttons -->
            
      <%= if is_superadmin do %>
        <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
          <!-- Button to delete user -->
          <button
            phx-click="delete_user"
            phx-value-user_id={user.id}
          class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
            Delete User
          </button>

          <!-- Button to toggle admin status -->
          <%= if is_admin do %>
            <button
             phx-click="revoke_admin"
            phx-value-user_id={user.id}

            class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
              Revoke Admin
            </button>
          <% else %>
            <button

            phx-click="make_admin"
            phx-value-user_id={user.id}

            class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
              Make Admin
            </button>
          <% end %>

            <!-- Action buttons -->
      <%= if is_admin && !is_superadmin do %>
        <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
          <!-- Button to toggle admin status -->
          <button class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
            Grant Superadmin
          </button>
        </div>
      <% end %>
        </div>
      <% end %>

          <!-- Display bets in a table -->
          <div class="bg-gray-50 px-4 py-5 sm:px-6">
            <h3 class="text-lg font-medium leading-6 text-gray-900">Bets</h3>
            <div class="mt-4">
              <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                  <tr>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Amount</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                    <!-- Add more table headers as needed -->
                  </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                  <%= for bet <- user.bets do %>
                    <tr>
                      <td class="px-6 py-4 whitespace-nowrap"><%= bet.id %></td>
                      <td class="px-6 py-4 whitespace-nowrap"><%= bet.amount %></td>
                      <td class="px-6 py-4 whitespace-nowrap"><%= bet.status %></td>
                      <!-- Add more table cells for other bet details -->
                    </tr>
                  <% end %>
                </tbody>
              </table>
            </div>
          </div>
        </dl>
      </div>


    </div>
    """
  end


  def handle_event("delete_user", %{"user_id" => user_id}, socket) do
    Accounts.delete_user(user_id)
    socket =
      socket
      |> put_flash(:info, "User deleted successfully.")
    {:noreply, push_event(socket, "update_section", value: "dashboard")}
  end

  # def handle_event("make_admin", %{"user_id" => user_id}, socket) do
  #   Accounts.make_admin(user_id)
  #   socket =
  #     socket
  #     |> put_flash(:info, "User is now an admin.")
  #   {:noreply, push_event(socket, "update_section", value: "dashboard")}
  # end

  # def handle_event("revoke_admin", %{"user_id" => user_id}, socket) do
  #   Accounts.remove_admin(user_id)
  #   socket =
  #     socket
  #     |> put_flash(:info, "User is no longer an admin.")
  #   {:noreply, push_event(socket, "update_section", value: "dashboard")}
  # end


end
