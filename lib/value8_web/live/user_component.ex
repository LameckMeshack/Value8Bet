defmodule Value8Web.UserComponent do
 use Phoenix.LiveComponent

def render(assigns) do
    ~H"""
    <div>
      <p>Email: <%= @user.email %></p>
      <p>Username: <%= @user.username %></p>
    </div>
    """
 end
end
