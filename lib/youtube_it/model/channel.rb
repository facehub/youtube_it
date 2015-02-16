class YouTubeIt
  module Model
    class Channel < YouTubeIt::Record
      attr_reader :channel_id
      attr_reader :uri
      attr_reader :updated
      attr_reader :title
      attr_reader :summary
      attr_reader :author_name
      attr_reader :author_uri
      attr_reader :author_id
      attr_reader :followers
      attr_reader :views
      attr_reader :avatar
    end
  end
end
