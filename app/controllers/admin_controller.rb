# frozen_string_literal: true

class AdminController < ApiController
  include Keycloak::Authentication
  # before_action :keycloak_authenticate
end
