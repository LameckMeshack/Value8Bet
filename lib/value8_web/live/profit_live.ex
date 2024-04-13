defmodule Value8Web.ProfitLive do
  use Phoenix.LiveComponent




  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div>
    <p>This is the profit live component</p>
    <div id="chart"></div>


    </div>
    """
  end

end
