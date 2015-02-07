module Refinery
  module Videos
    class VideosController < ::ApplicationController
      before_filter :find_all_videos

      def index
        present(@page)
      end

      def show
        @video = Video.find(params[:id])
        present(@page)
      end

      private

      def find_all_videos
        @videos = Video.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(link_url: '/videos').first
      end

    end
  end
end
