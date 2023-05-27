module Cast
  class Remove < Micro::Case
    attributes :id

    def call!
      cast = Record.find_by(id:)

      return Failure(:not_found) if cast.nil?

      cast.destroy

      Success(:ok)
    end
  end
end
