class YouTubeIt
  module Request #:nodoc:
    class ChannelSearch < BaseSearch #:nodoc:
      include FieldSearch

      # From here: http://code.google.com/apis/youtube/reference.html#yt_format
      ONLY_EMBEDDABLE = 5

      attr_reader :max_results                     # max_results
      attr_reader :offset                          # start-index
      attr_reader :query                           # vq
      attr_reader :response_format                 # alt, ([atom], rss, json)
      attr_reader :video_format                    # format (1=mobile devices)


      def initialize(params={})
        # Initialize our various member data to avoid warnings and so we'll
        # automatically fall back to the youtube api defaults
        @max_results, @offset, @query, @response_format, @video_format = nil
        @url = base_url
        @dev_key = params[:dev_key] if params[:dev_key]

        set_instance_variables(params)

        @url << build_query_params(to_youtube_params)
      end

      private

      def base_url
        super << "channels"
      end

      def to_youtube_params
        {
            'max-results' => @max_results,
            'start-index' => @offset,
            'v' => YouTubeIt::API_VERSION,
            'q' => @query,
            'alt' => @response_format,
            'format' => @video_format
        }
      end

    end
  end
end

