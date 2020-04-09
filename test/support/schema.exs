defmodule Current.Test.Actor do
  use Ecto.Schema

  schema "actors" do
    field(:name, :string)

    has_many(:credits, Current.Test.Credit)
    has_many(:movies, through: [:credits, :movie])
  end
end

defmodule Current.Test.Movie do
  use Ecto.Schema

  schema "movies" do
    field(:title, :string)
    field(:year, :integer)

    has_many(:credits, Current.Test.Credit)
    has_many(:actors, through: [:credits, :actor])
  end
end

defmodule Current.Test.Credit do
  use Ecto.Schema

  schema "credits" do
    belongs_to(:actor, Current.Test.Actor)
    belongs_to(:movie, Current.Test.Movie)
  end
end
