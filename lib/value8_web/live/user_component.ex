defmodule Value8Web.UserComponent do
 use Phoenix.LiveComponent

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
                  <span class="mt-1 font-medium text-secondary-dark text-lg/normal">All user from the Value8Bet team </span>
                </h3>
                <div class="relative flex flex-wrap items-center my-2">
                  <a href="javascript:void(0)" class="inline-block text-[.925rem] font-medium leading-normal text-center align-middle cursor-pointer rounded-2xl duration-150 ease-in-out text-light-inverse bg-light-dark border-light shadow-none border-0 py-2 px-5 hover:bg-secondary active:bg-light focus:bg-light">  </a>
                </div>
              </div>
              <!-- end card header -->
              <!-- card body  -->
              <div class="flex-auto block py-8 pt-6 px-9">
                <div class="overflow-x-auto">
                  <table class="w-full my-0 align-middle text-dark border-neutral-200">
                    <thead class="align-bottom">
                      <tr class="font-semibold text-[0.95rem] text-secondary-dark">
                        <th class="pb-3 text-start min-w-[100px]">Users</th>
                        <th class="pb-3 text-start min-w-[100px]">Level</th>
                        <th class="pb-3 text-start min-w-[100px]">Bets Placed</th>
                        <th class="pb-3 text-start min-w-[100px]">Bets Won</th>
                        <th class="pb-3 text-start min-w-[100px]">Bets Lost</th>
                        <th class="pb-3 pl-6 text-start min-w-[100px]">Actions</th>
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
                              <a href="javascript:void(0)" class="mb-1 font-normal duration-200 text-lg/normal text-secondary-inverse hover:text-primary">
                           <p>   <%= user.email %></p>
                           <p>   <%= user.first_name %>  <%= user.first_name %>  </p>
                              </a>
                            </div>
                          </div>
                        </td>
                        <td class="p-3 pr-0 text-start">
                          <span class="font-normal text-light-inverse text-md/normal">
                           <%= if user.admin do %>
                            Admin

                           <% else %>
                            User
                           <% end %>

                          </span>
                        </td>
                        <td class="p-3 pr-0 text-start">
                          <span class="text-center align-baseline inline-flex px-2 py-1 mr-auto items-center font-normal text-base/none text-success bg-success-light rounded-lg">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 mr-1">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18L9 11.25l4.306 4.307a11.95 11.95 0 015.814-5.519l2.74-1.22m0 0l-5.94-2.28m5.94 2.28l-2.28 5.941" />
                            </svg><%= length(user.bets) %></span>
                        </td>
                        <td class="p-3 pr-12 text-start">
                          <span class="text-center align-baseline inline-flex px-4 py-3 mr-auto items-center font-normal text-[.95rem] leading-none text-primary bg-primary-light rounded-lg"> 0 </span>
                        </td>
                        <td class="p-3 pr-12 text-start">
                           <span class="text-center align-baseline inline-flex px-4 py-3 mr-auto items-center font-normal text-[.95rem] leading-none text-primary bg-primary-light rounded-lg"> 0 </span>
                        </td>
                        <td class="p-3 flex text-start">
                          <button

                          phx-click="select_section"
            phx-value-section="view_user"
             phx-value-user_id={user.id} class="ml-auto relative text-secondary-dark bg-light-dark hover:text-primary flex items-center h-[25px] w-[25px] text-base font-medium leading-normal text-center align-middle cursor-pointer rounded-2xl duration-200 ease-in-out shadow-none border-0 justify-center">
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
  <path strokeLinecap="round" strokeLinejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
  <path strokeLinecap="round" strokeLinejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
</svg>

                         </button>
                            <%= if !user.admin || @is_superadmin  do %>

                          <button
                           phx-click="delete_user"
                            phx-value-user_id={user.id} class="ml-auto relative text-secondary-dark bg-light-dark hover:text-primary flex items-center h-[25px] w-[25px] text-base font-medium leading-normal text-center align-middle cursor-pointer rounded-2xl duration-200 ease-in-out shadow-none border-0 justify-center">
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
  <path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
</svg>                         </button>

                          <% end %>
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
