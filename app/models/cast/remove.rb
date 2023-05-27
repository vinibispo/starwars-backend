class Cast::Remove < Micro::Case
  attributes :id

  def call!
    cast = Cast.find_by(id:)

    return Failure(:not_found) if cast.nil?

    cast.destroy

    Success(:ok)
  end
end
