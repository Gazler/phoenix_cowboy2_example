defmodule PhoenixCowboy2Example.PageController do
  use PhoenixCowboy2Example.Web, :controller

  def index(conn, _params) do
    http2 =
      case conn.adapter do
        {_, %{version: :"HTTP/2"}} -> true
        _                          -> false
      end

    Plug.Conn.H2.push(conn, "/css/app.css", [{"accept", "text/css"}])
    Plug.Conn.H2.push(conn, "/js/app.js", [{"accept", "application/javascript"}])
    Plug.Conn.H2.push(conn, "/images/chart.png", [{"accept", "image/png"}])
    Plug.Conn.H2.push(conn, "/images/book.jpg", [{"accept", "image/jpeg"}])
    Plug.Conn.H2.push(conn, "/images/unicorn.jpg", [{"accept", "image/jpeg"}])
    Plug.Conn.H2.push(conn, "/images/magic.jpg", [{"accept", "image/jpeg"}])

    render conn, "index.html", http2: http2
  end
end
