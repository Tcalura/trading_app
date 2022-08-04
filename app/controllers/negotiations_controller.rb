# frozen_string_literal: true

class NegotiationsController < ApplicationController
  def create
    actor = NegotiationFlow.result(negotiation_params)
    if actor.success?
      render json: { data: 'negotiation processed' }, status: :ok
    else
      render json: actor.error, status: :unprocessable_entity
    end
  end

  private

  def negotiation_params
    params.permit(
      data: {
        user: [:user_id, { devices: %i[id quantity] }],
        target_user: [:user_id, { devices: %i[id quantity] }]
      }
    )
  end
end
