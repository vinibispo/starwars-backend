class Film::Remove < Micro::Case
  attributes :id

  def call!
    film = Film.find_by(id:)

    return Failure(:not_found) unless film

    film.destroy
    Success(:ok)
  end
end
