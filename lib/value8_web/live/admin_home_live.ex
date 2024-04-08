defmodule Value8Web.AdminHomeLive do
  use Value8Web, :live_view

  # def render(assigns) do
  #   ~H"""
  #   <h1>Hello Admin, welcome back.</h1>
  #   """
  # end

  # def mount(_params, _session, socket) do
  #   {:ok, socket}
  # end

#  def mount(_params, _session, socket) do
#     {:ok, assign(socket, :inner_content, "Default content")}
#  end

#   # def handle_params(params, _url, socket) do
#   #   page = Map.get(params, "page")
#   #   inner_content = case page do
#   #     "page1" -> "Content for page 1"
#   #     "page2" -> "Content for page 2"
#   #     _ -> "Default content"
#   #   end
#   #   {:noreply, assign(socket, :inner_content, inner_content)}
#   # end
# def handle_params(params, _url, socket) do
#   current_route = Map.get(params, "route")
#   inner_content = case current_route do
#     "/admin/home" -> {Value8Web.HeroComponent, [id: "home"]}
#     "/admin/home/settings" -> {Value8Web.HeroComponent2, [id: "settings"]}
#     _ -> {Value8Web.HeroComponent, [id: "default"]}
#   end
#   {:noreply, assign(socket, :inner_content, inner_content)}
# end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, content: :settings, selected_section: "home")}
  end

  def handle_event("sidebar_clicked", %{"section" => section}, socket) do
    {:noreply, assign(socket, content: String.to_atom(section))}
  end

  def handle_event("select_section", %{"section" => section}, socket) do
    {:noreply, assign(socket, :selected_section, section)}
  end

#    def handle_event("select_section", %{"section" => section}, socket) do
#     {:noreply, assign(socket, :selected_section, section)}
#  end

end
