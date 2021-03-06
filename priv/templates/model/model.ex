defmodule <%= module %> do
  use <%= base %>.Web, :model

  schema <%= inspect plural %> do
<%= for {k, _} <- attrs do %>    field <%= inspect k %>, <%= inspect types[k] %><%= defaults[k] %>
<% end %><%= for {k, _, m} <- assocs do %>    belongs_to <%= inspect k %>, <%= m %>
<% end %>
    timestamps
  end

  @required_fields ~w(<%= Enum.map_join(attrs, " ", &elem(&1, 0)) %>)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If the value of `params` is the symbol :empty, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
