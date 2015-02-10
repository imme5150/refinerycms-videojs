require 'stringex'

module Refinery
  module Videos
    class VideosController < ::ApplicationController
      before_filter :find_all_videos

      def index
        @flow = params[:flow]
        respond_to do |format|
          format.js
          format.html
        end
      end

      def show
        @video = Video.find(params[:id])
      end

      def search
        @flow = params[:flow]
        @query = params[:query]
        @videos = Video.with_query(params[:query].to_ascii).paginate(page: params[:page], per_page: 12)
        respond_to do |format|
          format.js { render 'refinery/videos/videos/index', videos: @videos }
          format.html { render 'refinery/videos/videos/index', videos: @videos }
        end
      end

      private

      def find_all_videos
        @videos = Video.order('position ASC').paginate(page: params[:page], per_page: 12)
      end

      def find_page
        @page = ::Refinery::Page.where(link_url: '/videos').first
      end

    end
  end
end
