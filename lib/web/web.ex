defmodule Web do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use Web, :controller
      use Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller
      import Plug.Conn
      import Web
      import Web.{Gettext, Helpers}
      alias Web.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      alias Web.Endpoint
      use Phoenix.View, root: "lib/web/templates"
      use Phoenix.HTML

      alias Web.Router.Helpers, as: Routes
      import Web.{Gettext, ErrorHelpers}
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import Web.Gettext
      import Web.Helpers
    end
  end

  def socket do
    quote do
      use Phoenix.Socket
      import Web
    end
  end

  def plug do
    quote do
      import Web
      import Plug.Conn
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
