defmodule Value8.Bets.BetPlacedNotifier do
  import Swoosh.Email

  alias Value8.Mailer

  defp info(recipient, title, body) do
    email =
      new()
      |> to(recipient)
      |> from({"Value8", "value@bets.com"})
      |> subject(title)
      |> text_body(body)

    with {:ok, _metadata} <- Mailer.deliver(email)  do
      {:ok, email}
    end
  end

# Function to deliver bet successfully

  def deliver_bet_successfully(user_email, url) do
    info(user_email, "Bet Placed Successfully", """
    ==============================
    Hi #{user_email},

    Your bet has been placed successfully. You can view your bet details by visiting the URL below:

    #{url}

    ==============================
    """)
  end



end
