defmodule Value8Web.UserComponent do
 use Phoenix.LiveComponent

# def render(assigns) do
#     ~H"""
#     <div>
#     <%= inspect(@user) %>
#       <p>Email: <%= @user.email %></p>
#       <p>Username: <%= @user.username %></p>
#     </div>
#     """
#  end

def render(assigns) do
    ~H"""
    <div class="flex flex-wrap -mx-3 mb-5">
    <div class="w-full max-w-full px-3 mb-6  mx-auto">
          <div class="relative flex-[1_auto] flex flex-col break-words min-w-0 bg-clip-border rounded-[.95rem] bg-white m-5">
            <div class="relative flex flex-col min-w-0 break-words border border-dashed bg-clip-border rounded-2xl border-stone-200 bg-light/30">
              <!-- card header -->
              <div class="px-9 pt-5 flex justify-between items-stretch flex-wrap min-h-[70px] pb-0 bg-transparent">
                <h3 class="flex flex-col items-start justify-center m-2 ml-0 font-medium text-xl/tight text-dark">
                  <span class="mr-3 font-semibold text-dark">Users Betting Data</span>
                  <span class="mt-1 font-medium text-secondary-dark text-lg/normal">All user from the Valu8Bet team</span>
                </h3>
                <div class="relative flex flex-wrap items-center my-2">
                  <a href="javascript:void(0)" class="inline-block text-[.925rem] font-medium leading-normal text-center align-middle cursor-pointer rounded-2xl transition-colors duration-150 ease-in-out text-light-inverse bg-light-dark border-light shadow-none border-0 py-2 px-5 hover:bg-secondary active:bg-light focus:bg-light"> See other projects </a>
                </div>
              </div>
              <!-- end card header -->
              <!-- card body  -->
              <div class="flex-auto block py-8 pt-6 px-9">
                <div class="overflow-x-auto">
                  <table class="w-full my-0 align-middle text-dark border-neutral-200">
                    <thead class="align-bottom">
                      <tr class="font-semibold text-[0.95rem] text-secondary-dark">
                        <th class="pb-3 text-start min-w-[175px]">Users</th>
                        <th class="pb-3 text-end min-w-[100px]">Level</th>
                        <th class="pb-3 text-end min-w-[100px]">Bets Placed</th>
                        <th class="pb-3 pr-12 text-end min-w-[175px]">Bets Won</th>
                        <th class="pb-3 pr-12 text-end min-w-[100px]">Bets Lost</th>
                        <th class="pb-3 text-end min-w-[50px]">Action</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%= for user <- @users do %>
                      <tr class="border-b border-dashed last:border-b-0">
                        <td class="p-3 pl-0">
                          <div class="flex items-center">
                            <div class="relative inline-block shrink-0 rounded-2xl me-3">
                              <img src="https://gravatar.com/avatar/cb3cc75ea248e54d6c8c248dy990452e11?s=400&d=robohash&r=x" class="w-[50px] h-[50px] inline-block shrink-0 rounded-2xl" alt="">
                            </div>
                            <div class="flex flex-col justify-start">
                              <a href="javascript:void(0)" class="mb-1 font-semibold transition-colors duration-200 ease-in-out text-lg/normal text-secondary-inverse hover:text-primary">
                           <p>   <%= user.email %></p>
                           <p>   <%= user.first_name %>  <%= user.first_name %>  </p>
                              </a>
                            </div>
                          </div>
                        </td>
                        <td class="p-3 pr-0 text-end">
                          <span class="font-semibold text-light-inverse text-md/normal">
                           <%= if user.admin do %>
                            Admin

                           <% else %>
                            User
                           <% end %>

                          </span>
                        </td>
                        <td class="p-3 pr-0 text-end">
                          <span class="text-center align-baseline inline-flex px-2 py-1 mr-auto items-center font-semibold text-base/none text-success bg-success-light rounded-lg">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 mr-1">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18L9 11.25l4.306 4.307a11.95 11.95 0 015.814-5.519l2.74-1.22m0 0l-5.94-2.28m5.94 2.28l-2.28 5.941" />
                            </svg><%= length(user.bets) %></span>
                        </td>
                        <td class="p-3 pr-12 text-end">
                          <span class="text-center align-baseline inline-flex px-4 py-3 mr-auto items-center font-semibold text-[.95rem] leading-none text-primary bg-primary-light rounded-lg"> 0 </span>
                        </td>
                        <td class="pr-0 text-start">
                          <span class="font-semibold text-light-inverse text-md/normal">0</span>
                        </td>
                        <td class="p-3 pr-0 text-end">
                          <button class="ml-auto relative text-secondary-dark bg-light-dark hover:text-primary flex items-center h-[25px] w-[25px] text-base font-medium leading-normal text-center align-middle cursor-pointer rounded-2xl transition-colors duration-200 ease-in-out shadow-none border-0 justify-center">
                            <span class="flex items-center justify-center p-0 m-0 leading-none shrink-0 ">
                              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
                              </svg>
                            </span>
                          </button>
                        </td>
                      </tr>
                    <% end %>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    """
 end
end
