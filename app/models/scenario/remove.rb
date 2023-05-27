class Scenario::Remove < Micro::Case
  attributes :id

  def call!
    scenario = Scenario.find_by(id:)

    return Failure(:not_found) if scenario.nil?

    scenario.destroy

    Success(:removed)
  end
end
