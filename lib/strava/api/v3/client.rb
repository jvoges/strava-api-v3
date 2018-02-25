require 'logger'
require 'strava/api/v3/activity'
require 'strava/api/v3/activity_extras'
require 'strava/api/v3/athlete'
require 'strava/api/v3/athlete_extras'
require 'strava/api/v3/club_group_event'
require 'strava/api/v3/club'
require 'strava/api/v3/gear'
require 'strava/api/v3/route'
require 'strava/api/v3/running_race'
require 'strava/api/v3/segment'
require 'strava/api/v3/segment_effort'
require 'strava/api/v3/stream'
require 'strava/api/v3/upload'

module Strava::Api::V3

  class Client

    include Activity
    include ActivityExtras
    include Athlete
    include AthleteExtras
    include ClubGroupEvent
    include Club
    include Gear
    include Route
    include RunningRace
    include Segment
    include SegmentEffort
    include Stream
    include Upload

    # Define the same set of accessors as the Awesome module
    attr_accessor *Configuration::VALID_CONFIG_KEYS
    attr_accessor :limit1, :used1, :limit2, :used2

    def initialize(options={})
      # Merge the config values from the module and those passed
      # to the client.
      merged_options = Strava::Api::V3.options.merge(options)

      # Copy the merged values to this client and ignore those
      # not part of our configuration
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end

  end # Client

end
