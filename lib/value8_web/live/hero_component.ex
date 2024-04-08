defmodule Value8Web.HeroComponent do
 use Phoenix.LiveComponent

def render(assigns) do
    content = assigns[:content]

    case content do
      :dashboard ->
        ~H"""
        <div>
          <!-- Render dashboard content -->
          <p>This is the dashboard content</p>
        </div>
        """
      :settings ->
        ~H"""
        <div>
          <!-- Render settings content -->
          <p>This is the settings content</p>
        </div>
        """
      _ ->
        ~H"""
        <div>
          <!-- Render default content -->
          <p>This is the default content</p>
        </div>
        """
    end
  end
end
