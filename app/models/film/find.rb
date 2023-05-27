class Film::Find < Micro::Case
  attributes :id

  def call!
    film = Film.find_by(id:)

    return Success result: { film: } if film

    Failure :not_found
  end
end
