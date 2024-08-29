# frozen_string_literal: true

class ApiController < ApplicationController
    include Keycloak::Authentication      
    before_action :keycloak_authenticate
   
end
