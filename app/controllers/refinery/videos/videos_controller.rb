module Refinery
  module Videos
    class VideosController < ::ApplicationController
      before_filter :find_all_videos

      def index
        if params[:flow] == 'list'
          render 'videos_list'
        else
          render 'videos_grid'
        end          
      end

      def show
        @video = Video.find(params[:id])
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
