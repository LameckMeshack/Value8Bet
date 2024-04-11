defmodule Value8Web.ViewUser do
  use Phoenix.LiveComponent

  def render(assigns) do
    user = assigns[:selected_user]
    is_admin = user.admin != nil
    is_superadmin = is_admin && Enum.any?(user.admin.permissions, fn p -> p.name == "superadmin" end)

    ~H"""
    <div class="bg-white shadow overflow-hidden sm:rounded-lg">
      <div class="px-4 py-5 sm:px-6">
        <h3 class="text-lg font-medium leading-6 text-gray-900">User Details</h3>
    
      </div>
      <div class="border-t border-gray-200">
        <dl>
          <!-- Display user details -->
          <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
            <dt class="text-sm font-medium text-gray-500">Email</dt>
            <dd class="mt-1 text-sm text-gray-900 sm:col-span-2"><%= user.email %></dd>
          </div>
          <!-- Add more fields as needed -->

          <!-- Display admin status -->
          <%= if is_admin do %>
            <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500">Admin Status</dt>
              <dd class="mt-1 text-sm text-gray-900 sm:col-span-2">Admin</dd>
            </div>
          <% end %>

          <!-- Display dummy avatar -->
          <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
            <dt class="text-sm font-medium text-gray-500">Avatar</dt>
            <dd class="mt-1 text-sm text-gray-900 sm:col-span-2">
              <img src="https://dummyimage.com/50x50/000/fff&text=Avatar" alt="Avatar" />
            </dd>
          </div>

          <!-- Display bets -->
          <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
            <dt class="text-sm font-medium text-gray-500">Bets</dt>
            <dd class="mt-1 text-sm text-gray-900 sm:col-span-2">
              <ul>
                <%= for bet <- user.bets do %>
                  <li><%= bet.id %>: <%= bet.amount %> on <%= bet.fixture_id %> - <%= bet.status %></li>
                <% end %>
              </ul>
            </dd>
          </div>
        </dl>
      </div>

      <!-- Action buttons -->
      <%= if !is_superadmin do %>
        <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
          <!-- Button to delete user -->
          <button class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
            Delete User
          </button>

          <!-- Button to toggle admin status -->
          <%= if is_admin do %>
            <button class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
              Revoke Admin
            </button>
          <% else %>
            <button class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
              Make Admin
            </button>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end
end
