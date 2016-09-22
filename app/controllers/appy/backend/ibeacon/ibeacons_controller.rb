module Appy
  module Backend
    module Ibeacon
      class IbeaconsController < ApplicationController

        expose(:app) { Appy::App.find(params[:app_id]) }
        expose(:ibeacon, model: Appy::Ibeacon::Tracking)
        expose(:ibeacons) { Appy::Sorter.new(Appy::Ibeacon::Tracking, app, search_results_for(params[:q], Appy::Ibeacon::Tracking.all, Appy::Ibeacon::Tracking::SEARCH_FIELDS)).sort(params) }
        expose(:tracking_details) { Appy::Sorter.new(Appy::Ibeacon::TrackingDetail.where(tracking_id: ibeacon), app, search_results_for(params[:q], Appy::Ibeacon::TrackingDetail.where(tracking_id: ibeacon), Appy::Ibeacon::TrackingDetail::SEARCH_FIELDS)).sort(params) }

        def create
          if ibeacon.save
            flash.notice = t("appy.backend.ibeacon.notice.created")
            redirect_to app_ibeacons_path(app)
          else
            flash.alert = t("appy.backend.ibeacon.notice.failed", action: "create")
            render 'new'
          end
        end

        def update
          if ibeacon.save
            flash.notice = t("appy.backend.ibeacon.notice.updated", ibeacon_id: ibeacon.id)
            redirect_to edit_app_ibeacon_path(app, ibeacon)
          else
            flash.now.alert = t("appy.backend.ibeacon.notice.failed", action: "update")
            render 'edit'
          end
        end

        def destroy
          if ibeacon.destroy
            flash.notice = t("appy.backend.ibeacon.notice.deleted")
          else
            flash.alert = t("appy.backend.ibeacon.notice.failed", action: "delete")
          end
          redirect_to app_ibeacons_path(app)
        end

        private
          def ibeacon_params
            params.require(:ibeacon).permit(:id, :name, :message)
          end
      end
    end
  end
end
