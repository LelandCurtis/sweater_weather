FactoryBot.define do
  factory :book do

    isbn { [
            "9780883183663",
            "0883183668"
          ] }
    title { "Photovoltaic safety, Denver, CO, 1988" }
    publisher { [
                "Crescent Books",
                "Random House Value Publishing",
                "Distributed by Crown Publishers",
                "Crescent"
                ] }

    intiailize_with { new(attributes) }
  end
end
