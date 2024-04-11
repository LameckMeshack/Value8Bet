defmodule Value8Web.ViewUser do
 use Phoenix.LiveComponent

def render(assigns) do
    ~H"""
    <div>
Thus is a single user
<%= inspect(@selected_user) %>
    </div>
    """
 end
end
