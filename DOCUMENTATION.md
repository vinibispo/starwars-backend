# API Documentation

This API provides endpoints to interact with various resources.

## Authentication

All endpoints, except for the following, require authentication:

- `POST /users`
- `POST /sessions`
- `POST /passwords/forgot`
- `POST /passwords/reset`

To authenticate, include an `Authorization` header in the request with a valid user token.

## Films

### List Films

- Endpoint: `GET /films`
- Controller: `FilmsController#index`
- Description: Retrieves a paginated list of films.
- Parameters:
  - `q` (string, optional): Search query parameter.

### Show Film

- Endpoint: `GET /films/:id`
- Controller: `FilmsController#show`
- Description: Retrieves details of a specific film.
- Parameters:
  - `id` (integer): ID of the film.

### Create Film

- Endpoint: `POST /films`
- Controller: `FilmsController#create`
- Description: Creates a new film.
- Parameters:
  - `film` (object):
    - `title` (string, required): Title of the film.
    - `episode_id` (integer, required): Episode ID of the film.
    - `opening_crawl` (string, required): Opening crawl text of the film.
    - `director` (string, required): Director of the film.
    - `producer` (string, required): Producer of the film.
    - `release_date` (string, required): Release date of the film.

### Update Film

- Endpoint: `PUT /films/:id`
- Controller: `FilmsController#update`
- Description: Updates a specific film.
- Parameters:
  - `id` (integer): ID of the film.
  - `film` (object):
    - `title` (string, optional): Updated title of the film.
    - `episode_id` (integer, optional): Updated episode ID of the film.
    - `opening_crawl` (string, optional): Updated opening crawl text of the film.
    - `director` (string, optional): Updated director of the film.
    - `producer` (string, optional): Updated producer of the film.
    - `release_date` (string, optional): Updated release date of the film.

### Delete Film

- Endpoint: `DELETE /films/:id`
- Controller: `FilmsController#destroy`
- Description: Deletes a specific film.
- Parameters:
  - `id` (integer): ID of the film.

## Planets

### List Planets

- Endpoint: `GET /planets`
- Controller: `PlanetsController#index`
- Description: Retrieves a paginated list of planets.
- Parameters:
  - `q` (string, optional): Search query parameter.

### Show Planet

- Endpoint: `GET /planets/:id`
- Controller: `PlanetsController#show`
- Description: Retrieves details of a specific planet.
- Parameters:
  - `id` (integer): ID of the planet.

### Create Planet

- Endpoint: `POST /planets`
- Controller: `PlanetsController#create`
- Description: Creates a new planet.
- Parameters:
  - `planet` (object):
    - `name` (string, required): Name of the planet.
    - `diameter` (integer, required): Diameter of the planet.
    - `rotation_period` (integer, required): Rotation period of the planet.
    - `orbital_period` (integer, required): Orbital period of the planet.
    - `gravity` (string, required): Gravity of the planet.
    - `population` (integer, required): Population of the planet.
    - `climate` (string, required): Climate of the planet.
    - `terrain` (string, required): Terrain of the planet.
    - `surface_water` (float, required): Surface water percentage of the planet.

### Update Planet

- Endpoint: `PUT /planets/:id`
- Controller: `PlanetsController#update`
- Description: Updates a specific planet.
- Parameters:
  - `id` (integer): ID of the planet.
  - `planet` (object):
    - `name` (string, optional): Updated name of the planet.
    - `diameter` (integer, optional): Updated diameter of the planet.
    - `rotation_period` (integer, optional): Updated rotation period of the planet.
    - `orbital_period` (integer, optional): Updated orbital period of the planet.
    - `gravity` (string, optional): Updated gravity of the planet.
    - `population` (integer, optional): Updated population of the planet.
    - `climate` (string, optional): Updated climate of the planet.
    - `terrain` (string, optional): Updated terrain of the planet.
    - `surface_water` (float, optional): Updated surface water percentage of the planet.

### Delete Planet

- Endpoint: `DELETE /planets/:id`
- Controller: `PlanetsController#destroy`
- Description: Deletes a specific planet.
- Parameters:
  - `id` (integer): ID of the planet.

## People (Characters)

### List People

- Endpoint: `GET /people`
- Controller: `PeopleController#index`
- Description: Retrieves a paginated list of people (characters).
- Parameters:
  - `q` (string, optional): Search query parameter.

### Show Person

- Endpoint: `GET /people/:id`
- Controller: `PeopleController#show`
- Description: Retrieves details of a specific person (character).
- Parameters:
  - `id` (integer): ID of the person.

### Create Person

- Endpoint: `POST /people`
- Controller: `PeopleController#create`
- Description: Creates a new person.
- Parameters:
  - `character` (object):
    - `name` (string, required): Name of the person.
    - `birth_year` (string, required): Birth year of the person.
    - `eye_color` (string, required): Eye color of the person.
    - `gender` (string, required): Gender of the person.
    - `hair_color` (string, required): Hair color of the person.
    - `height` (float, required): Height of the person.
    - `mass` (float, required): Mass of the person.
    - `skin_color` (string, required): Skin color of the person.
    - `homeworld` (string, required): Homeworld of the person.

### Update Person

- Endpoint: `PUT /people/:id`
- Controller: `PeopleController#update`
- Description: Updates a specific person.
- Parameters:
  - `id` (integer): ID of the person.
  - `character` (object):
    - `name` (string, optional): Updated name of the person.
    - `birth_year` (string, optional): Updated birth year of the person.
    - `eye_color` (string, optional): Updated eye color of the person.
    - `gender` (string, optional): Updated gender of the person.
    - `hair_color` (string, optional): Updated hair color of the person.
    - `height` (float, optional): Updated height of the person.
    - `mass` (float, optional): Updated mass of the person.
    - `skin_color` (string, optional): Updated skin color of the person.
    - `homeworld` (string, optional): Updated homeworld of the person.

### Delete Person

- Endpoint: `DELETE /people/:id`
- Controller: `PeopleController#destroy`
- Description: Deletes a specific person.
- Parameters:
  - `id` (integer): ID of the person.

## Casts (Relation between Character and Film)

### Create Cast

- Endpoint: `POST /casts`
- Controller: `CastsController#create`
- Description: Creates a new cast association between a character and a film.
- Parameters:
  - `cast` (object):
    - `film_id` (integer, required): ID of the film.
    - `character_id` (integer, required): ID of the character.

### Delete Cast

- Endpoint: `DELETE /casts/:id`
- Controller: `CastsController#destroy`
- Description: Deletes a specific cast association.
- Parameters:
  - `id` (integer): ID of the cast association.

## Scenarios (Relation between Planet and Film)

### Create Scenario

- Endpoint: `POST /scenarios`
- Controller: `ScenariosController#create`
- Description: Creates a new scenario association between a film and a planet.
- Parameters:
  - `scenario` (object):
    - `film_id` (integer, required): ID of the film.
    - `planet_id` (integer, required): ID of the planet.

### Delete Scenario

- Endpoint: `DELETE /scenarios/:id`
- Controller: `ScenariosController#destroy`
- Description: Deletes a specific scenario association.
- Parameters:
  - `id` (integer): ID of the scenario association.

## Users

### Create User

- Endpoint: `POST /users`
- Controller: `UsersController#create`
- Description: Creates a new user.
- Parameters:
  - `user` (object):
    - `name` (string): User's name.
    - `email` (string): User's email address.
    - `password` (string): User's password.

## Sessions

### Create Session (Login)

- Endpoint: `POST /sessions`
- Controller: `SessionsController#create`
- Description: Creates a new session (login) for a user.
- Parameters:
  - `session` (object):
    - `email` (string): User's email address.
    - `password` (string): User's password.

## Passwords

### Forgot Password

- Endpoint: `POST /passwords/forgot`
- Controller: `PasswordsController#forgot`
- Description: Initiates the password reset process by sending a password reset email to the user.
- Parameters:
  - `email` (string): User's email address.
- Response:
  - Success: Returns a JSON object with the `message` attribute indicating that the password reset email has been sent.
  - Failure: Returns a JSON object with the `error` attribute indicating that the user was not found.

### Reset Password

- Endpoint: `POST /passwords/reset`
- Controller: `PasswordsController#reset`
- Description: Resets the user's password using the password reset token.
- Parameters:
  - `password_reset_token` (string): Token for password reset.
  - `password` (string): New password.
- Response:
  - Success: Returns a JSON object with the `message` attribute indicating that the password has been reset.
  - Failure: Returns a JSON object with the `error` attribute indicating that the token is invalid or not found.
