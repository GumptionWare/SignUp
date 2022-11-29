defmodule SignUpWeb.SignupController do
  use SignUpWeb, :controller

  def index(conn, _params) do
    changeset = SignUp.User.changeset(%SignUp.User{})
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, params) do
    case SignUp.User.new(params["user"]) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Success!")
        |> redirect(to: "/")

      {:error, changeset} ->
        conn
        |> put_flash(:error, "Failure!")
        |> render("index.html", changeset: changeset)
    end
  end
end
