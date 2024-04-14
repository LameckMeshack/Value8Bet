defmodule Value8Web.NewFixtureLive do
 use Phoenix.LiveComponent

   use Value8Web, :live_view

  alias Value8.Games.Team
  alias Value8.Bets.Odds
 @impl Phoenix.LiveView
 def render(assigns) do
   ~H"""
   <div>

   <h1>New Fixture</h1>

   </div>
   """
 end

end
