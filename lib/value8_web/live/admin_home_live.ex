defmodule Value8Web.AdminHomeLive do
  alias Value8.Bets
  alias Value8.Games
  alias Value8.Games.Fixture

  alias Value8.Repo
  alias Value8.Accounts
  use Value8Web, :live_view
  # import Value8Web.Charts


  def mount(_params, _session, socket) do
 users = Accounts.list_users()

 categories = Games.list_categories()
 teams = Games.list_teams()
 id= socket.assigns.current_user.id
 current_user = Accounts.get_user!(id) |> Repo.preload([admin: :permissions])
   is_superadmin = Enum.any?(current_user.admin.permissions, fn permission -> permission.name == "superadmin" end)
 {:ok, assign(socket, content: :settings, selected_section: "dashboard", users: users, user_id: nil, is_superadmin: is_superadmin, categories: categories, teams: teams)}
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

def handle_event("make_superadmin", %{"admin_id" => admin_id}, socket) do
  admin_id = String.to_integer(admin_id)
    Accounts.create_permission(%{name: "superadmin", admin_id: admin_id})
  users = Accounts.list_users()
  socket =
    socket
    |> assign(:users, users)
     |> assign(:selected_section, "users")
    |> put_flash(:info, "User is now a superadmin.")
  {:noreply, socket}
end

def handle_event("revoke_superadmin", %{"admin_id" => admin_id}, socket) do
  admin_id = String.to_integer(admin_id)
  Accounts.delete_permission(admin_id)
  users = Accounts.list_users()
  socket =
    socket
    |> assign(:users, users)
     |> assign(:selected_section, "users")
    |> put_flash(:info, "User is no longer a superadmin.")
  {:noreply, socket}
end

def handle_event("submit_form", %{"match_date" => match_date, "match_time" => match_time, "category_id" => category_id, "team1_id" => team1_id, "team1_odds" => team1_odds, "team2_id" => team2_id, "team2_odds" => team2_odds} = params, socket) do
  # Process form data
  # changeset_fixture = Fixture.changeset(%Fixture{}, %{
  #   match_date: match_date,
  #   match_time: match_time,
  #   category_id: category_id,
  #   team1_id: team1_id,
  #   team2_id: team2_id
  # })
  fixture_attrs = %{
    match_date: match_date,
    match_time: match_time,
    category_id: String.to_integer(category_id),
    team1_id: String.to_integer(team1_id),
    team2_id: String.to_integer(team2_id)
  }

  # odds_attr =  %{
  #   team1_odds: Decimal.cast(team1_odds),
  #   team2_odds: Decimal.cast(team2_odds)
  # }

  # case Games.create_fixture(fixture_attrs) do
  #   {:ok, fixture} ->
  #     {:noreply, socket, put_flash(socket, :info, "Fixture and odds created successfully!"),
  #      assigns: %{fixture: fixture}}
  #   {:error, %Ecto.Changeset{} = changeset_fixture, changeset_odds} ->
  #     {:noreply, socket, assigns: %{changeset_fixture: changeset_fixture, changeset_odds: changeset_odds}}
  #   {:error, reason} ->
  #     {:noreply, socket, put_flash(socket, :error, "Error creating fixture and odds: #{reason}")}
  # end
  case Games.create_fixture(fixture_attrs) do
  {:ok, fixture} ->
      odds_attr =  %{
    team1_odds: Decimal.cast(team1_odds),
    team2_odds: Decimal.cast(team2_odds),
    fixture_id: fixture.id
  }

    case Bets.create_odds( odds_attr) do
      {:ok, _odds} ->
        socket =
    socket
    |> put_flash(:info, "Fixture and Odds Created succesfully.")
        {:noreply, socket}
      {:error, _reason} ->
        socket =
    socket
    |> put_flash(:error, "Error creating odds.")

        {:noreply, socket}
    end
  {:error, _reason} ->
    socket =
    socket
    |> put_flash(:error, "Error creating fixture.")
    {:noreply, socket}
end
end

end
