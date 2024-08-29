module KeycloakMethods
    extend ActiveSupport::Concern
  
    class_methods do
      def login
        url = Rails.application.credentials.KEYCLOAK_SERVER_URL + '/realms/' + Rails.application.credentials.KEYCLOAK_REALM_ID + '/protocol/openid-connect/token'
  
        response = HTTParty.post(url,
                                 body: {
                                   client_id: Rails.application.credentials.KEYCLOAK_CLIENT_ID,
                                   client_secret: Rails.application.credentials.KEYCLOAK_CLIENT_SECRET,
                                   grant_type: 'password',
                                   username: Rails.application.credentials.KEYCLOAK_USERNAME,
                                   password: Rails.application.credentials.KEYCLOAK_PASSWORD
                                 })
  
        "Bearer " << response['access_token']
      end
    end
  end
  