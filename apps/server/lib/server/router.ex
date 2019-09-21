defmodule Server.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get("/", to: Server.Pluggy)

  match _ do
    send_resp(conn, 404, "oops")
  end
end
