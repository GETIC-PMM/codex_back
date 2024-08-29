module KeycloakMethods
  def self.login
    url = "#{Rails.application.credentials.KEYCLOAK_SERVER_URL}/realms/#{Rails.application.credentials.KEYCLOAK_REALM_ID_LOGIN}/protocol/openid-connect/token"

    response = HTTParty.post(
      url,
      body: {
        client_id: Rails.application.credentials.KEYCLOAK_CLIENT_ID,
        grant_type: "password",
        username: Rails.application.credentials.KEYCLOAK_USERNAME,
        password: Rails.application.credentials.KEYCLOAK_PASSWORD
      },
      verify: false
    )

    "Bearer " << response["access_token"]
  end
end
