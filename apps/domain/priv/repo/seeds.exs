{:ok, tom} =
  Domain.UserRegistration.create(%{
    username: "tom",
    password: "jerry",
    password_confirmation: "jerry"
  })

{:ok, jerry} =
  Domain.UserRegistration.create(%{
    username: "jerry",
    password: "tom",
    password_confirmation: "tom"
  })

{:ok, _word} =
  Domain.Word.create(%{
    user_id: tom.id,
    spelling: "orange"
  })

{:ok, game} =
  Domain.Game.create(%{
    gamemaster_id: tom.id,
    codename: "Game",
    team_size: 2,
    leaflets_per_player: 5,
    seconds_per_turn: 60
  })

{:ok, _team} = Domain.Team.create(%{name: "Lemon sheperd", score: 0})

{:ok, _player_one} =
  Domain.Player.create(%{
    user_id: tom.id,
    game_id: game.id
  })

{:ok, _player_two} =
  Domain.Player.create(%{
    user_id: jerry.id,
    game_id: game.id
  })
