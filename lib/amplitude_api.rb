class AmplitudeAPI

  AmplitudeAPI.config.api_key = ENV["AMP_API_KEY"]

  TRACK_URI_STRING        = 'https://api.amplitude.com/httpapi'.freeze
  IDENTIFY_URI_STRING     = 'https://api.amplitude.com/identify'.freeze
  SEGMENTATION_URI_STRING = 'https://amplitude.com/api/2/events/segmentation'.freeze
  DELETION_URI_STRING     = 'https://amplitude.com/api/2/deletions/users'.freeze

  USER_WITH_NO_ACCOUNT = "user who doesn't have an account".freeze

  class << self
    def config
      Config.instance
    end

    def configure
      yield config
    end

    def api_key
      config.api_key
    end

    def secret_key
      config.secret_key
    end

    def send_event(event_name, user, device, options = {})
      event = AmplitudeAPI::Event.new(
        user_id: user,
        device_id: device,
        event_type: event_name,
        event_properties: options.fetch(:event_properties, {}),
        user_properties: options.fetch(:user_properties, {})
      )
      track(event)
    end

end
