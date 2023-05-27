module Scenario
  class Remove < Micro::Case
    attributes :id

    def call!
      scenario = Record.find_by(id:)

      return Failure(:not_found) if scenario.nil?

      scenario.destroy

      Success(:removed)
    end
  end
end
