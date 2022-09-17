# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Brewshare.Repo.insert!(%Brewshare.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Brewshare.{Brew, Brewer, Coffee, Grinder, Recipe, User, Repo}

Repo.delete_all(Brew)
Repo.delete_all(Recipe)
Repo.delete_all(Grinder)
Repo.delete_all(Brewer)
Repo.delete_all(Coffee)
Repo.delete_all(User)

rickhenry =
  %{
    name: "Rick Henry",
    email: "rickhenry@rickhenry.dev",
    username: "rickhenry"
  }
  |> User.changeset()
  |> Repo.insert!()

reanimator_ethiopian =
  %{
    coo: "Ethiopia",
    roast: :light,
    name: "Ethiopia Goro Muda Natural Process",
    roaster: "Reanimator Coffee Roasters",
    link:
      "https://www.reanimatorcoffee.com/collections/single-origin-coffee/products/ethiopia-goro-muda-natural-process"
  }
  |> Coffee.changeset()
  |> Repo.insert!()

dirt_cowboy_blend =
  %{
    roast: :blend,
    name: "Canoe Club Blend",
    roaster: "Dirt Cowboy",
    link: "https://dirtcowboycafe.com/collections/blends/products/canoe-club-blend"
  }
  |> Coffee.changeset()
  |> Repo.insert!()

hario_v60 =
  %{
    brand: "Hario",
    name: "V60 Ceramic",
    method: "Pour Over"
  }
  |> Brewer.changeset()
  |> Repo.insert!()

bodum_french_press =
  %{
    brand: "Bodum",
    name: "Chambord French Press",
    method: "French Press"
  }
  |> Brewer.changeset()
  |> Repo.insert!()

baratza_encore =
  %{
    brand: "Baratza",
    name: "Encore",
    spec_notes: "Conical Burr Grinder"
  }
  |> Grinder.changeset()
  |> Repo.insert!()

weber_eg1 =
  %{
    brand: "Weber",
    name: "EG-1",
    spec_notes: "Flat burr, smooth adjustable, single-dose grinder"
  }
  |> Grinder.changeset()
  |> Repo.insert!()

recipe1 =
  %{
    duration: 210,
    grind: "medium-fine",
    water_mass: 500,
    water_temp: 100,
    weight: 30,
    name: "Hoffman V60",
    step_list: [
      "Grind 30g of coffee",
      "Rinse paper filter with water just off the boil",
      "Add coffee grounds to V60",
      "Create a well in the middle of the grounds",
      "Start Timer",
      "Add 2x Coffee Weight (60g) of bloom water",
      "Swirl the coffee slurry until evenly mixed",
      "Bloom for up to 45 seconds",
      "At 0:45, Add water aming for 60% of total brew weight (300g) in the next 30 seconds",
      "At 1:15, Add water aiming for 100% of total brew weight (500g) in the next 30 seconds",
      "At 1:45, Stir one time counterclockwise and one time clockwise with a spoon to knock grounds off the side wall",
      "Allow V60 to drain a little, then give it a gentle swirl",
      "Let the brew drawdown, aiming to finish by 3:30"
    ],
    user_id: rickhenry.id
  }
  |> Recipe.changeset()
  |> Repo.insert!()

recipe2 =
  %{
    water_mass: 500,
    weight: 30,
    grind: "medium-coarse",
    water_temp: 100,
    name: "Hoffman French Press",
    user_id: rickhenry.id,
    duration: 800,
    step_list: [
      "Boil water",
      "Weigh coffee",
      "Put coffee into french press and pour in 500g of boiling water, pouring in circles ensuring there are no dry spots.",
      "Wait five minutes",
      "Stir the grounds to break up the top crust",
      "Scoop the foam and bits still at the top",
      "Wait five more minutes, allowing grounds to settle",
      "Plunge press until the screen rests on top of the liquid, not all the way down",
      "Pour carefully to avoid stirring up settled bits"
    ]
  }
  |> Recipe.changeset()
  |> Repo.insert!()

%{
  datetime: DateTime.now!("Etc/UTC"),
  flavor_rating: 5,
  filter: "V60 standard",
  recipe_id: recipe1.id,
  coffee_id: reanimator_ethiopian.id,
  grinder_id: baratza_encore.id,
  brewer_id: hario_v60.id,
  user_id: rickhenry.id
}
|> Brew.changeset()
|> Repo.insert!()
