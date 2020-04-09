# Current

[![Continuous Integration](https://img.shields.io/travis/bloodhawk/current/master.svg)](https://travis-ci.org/bloodhawk/current)
[![Code Coverage](https://img.shields.io/coveralls/bloodhawk/current/master.svg)](https://coveralls.io/github/bloodhawk/current)
[![Documentation](http://inch-ci.org/github/bloodhawk/current.svg)](http://inch-ci.org/github/bloodhawk/current)
[![Package](https://img.shields.io/hexpm/v/current.svg)](https://hex.pm/packages/current)

Current provides more powerful streaming mechanisms than those offered by [Ecto](https://github.com/elixir-ecto/ecto). 
Forked from [Bourne](https://github.com/mtwilliams/bourne) which is inactive.

## Example

```elixir
defmodule My.Repo do
  use Ecto.Repo, otp_app: :mine
  use Current
end

import Ecto.Query
q = from(actor in Actor, where: actor.born <= 1980)

# You can stream through an `Enumerable`:
My.Repo.stream(q) |> Stream.each(&IO.inspect) |> Stream.run
```

## Installation

  1. Add `current` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:current, "~> 2.0"}]
  end
  ```

  2. Fetch and compile your new dependency:

  ```
  mix do deps.get current, deps.compile
  ```

  3. Drink your :tea:

  4. That's it!

## Usage

Refer to the [documentation](https://hexdocs.pm/current/Current.html).

### ASDF

Using Bash:
```shell
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bash_profile
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bash_profile
source ~/.bash_profile
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
# cd path/to/current
asdf install
asdf reshim
mix local.hex --if-missing
mix local.rebar --force
mix do deps.get, compile
```

## Testing

The test suite relies on a locally running postgres insatnce. You can use docker to create one quickly:

```
docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres
```

## License

Current is free and unencumbered software released into the public domain, with fallback provisions for jurisdictions that don't recognize the public domain.

For details, see `LICENSE.md`.
