module Appy
  module Backend
    module Ibeacon
      class TrackingDetailsController < ApplicationController

        expose(:app) { Appy::App.find(params[:app_id]) }
        expose(:ibeacon) { Appy::Ibeacon::Tracking.find(params[:ibeacon_id]) }
        expose(:tracking_detail) { Appy::Ibeacon::TrackingDetails.find(params[:id]) }

        def destroy
          if tracking_detail.destroy
            flash.notice = t("appy.backend.ibeacon.notice.deleted")
          else
            flash.alert = t("appy.backend.ibeacon.notice.failed", action: "delete")
          end
          redirect_to app_ibeacon_path(app, ibeacon)
        end
      end
    end
  end
end
