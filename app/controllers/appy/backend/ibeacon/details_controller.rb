module Appy
  module Backend
    module Ibeacon
      class DetailsController < ApplicationController

        expose(:app) { Appy::App.find(params[:app_id]) }
        expose(:ibeacon) { Appy::Ibeacon::Tracking.find(params[:ibeacon_id]) }
        
        def destroy
          @trackingDetail = Appy::Ibeacon::TrackingDetail.find(params[:id])
          if @trackingDetail.destroy
            flash.notice = "Deleted"
          else
            flash.now.alert = "Something went wrong cant't delete!"
          end
          redirect_to app_ibeacon_path(app, ibeacon)
        end
      end
    end
  end
end
