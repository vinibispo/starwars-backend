# StarWars Backend

This is a Ruby on Rails API application that serves as the backend for the [StarWars Frontend](https://github.com/vinibispo/starwars-frontend). It provides a RESTful API to interact with the application's resources.

## Prerequisites

- Ruby (version 3.2.0)
- Ruby on Rails (version 7.1.0.alpha)

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/vinibispo/starwars-backend.git
   ```

2. Install the dependencies:

   ```bash
   bundle install
   ```

3. Set up the database:

   ```bash
   rails db:setup
   ```

4. Start the server:

   ```bash
   rails server
   ```

   The API will be available at `http://localhost:8000`.

## API Documentation

The API documentation can be found at [API Documentation](DOCUMENTATION.md).

## Configuration

The following environment variables need to be configured:

- `RAILS_MASTER_KEY`: 72341bc95e2cd9c137050928cfb4f337

## Development

- Run the tests:

  ```bash
  bundle exec rails spec
  ```

## Contributing

1. Fork the repository.
2. Create a new branch for your feature or bug fix: `git checkout -b my-feature`.
3. Make the necessary changes and commit them: `git commit -am 'Add new feature'`.
4. Push the branch to your forked repository: `git push origin my-feature`.
5. Submit a pull request on the original repository.

## License

This project is licensed under the [MIT License](LICENSE.md).

## Contact

- Your Name: [Vinícius Bispo](mailto:vini.bispo015@gmail.com)

Feel free to reach out with any questions or feedback.

---
