{:ok, user} =
  Domain.UserRegistration.create(%{
    username: "tom",
    password: "jerry",
    password_confirmation: "jerry"
  })

{:ok, _word} =
  Domain.Word.create(%{
    user_id: user.id,
    spelling: "orange"
  })

{:ok, _game} =
  Domain.Game.create(%{
    gamemaster_id: user.id,
    codename: "Game"
    team_size: 2,
    leaflets_per_player: 5,
    seconds_per_turn: 60
  })
