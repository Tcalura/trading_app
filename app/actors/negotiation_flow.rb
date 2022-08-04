# frozen_string_literal: true

class NegotiationFlow < Actor
  play FindUsers,
       NormalizeDevices,
       FindInventories,
       MatchDevices
end
