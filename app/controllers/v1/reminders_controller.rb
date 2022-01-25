module V1
  class RemindersController < ApplicationController
    before_action :set_reminder, only: %i[show update destroy]

    # GET /reminders
    def index
      @reminders = current_user.reminders.chronologically_sorted.map do |r|
        {
          id: r.id,
          description: r.description,
          date: r.datetime.to_date,
          time: r.datetime.strftime('%H:%M'),
          city: r.city,
          location_coordinates: r.location_coordinates
        }
      end
      json_response(@reminders)
    end

    # POST /reminders
    def create
      @reminder = current_user.reminders.create!(reminder_params)
      json_response(@reminder, :created)
    end

    # GET /reminders/:id
    def show
      json_response(@reminder)
    end

    # PUT /reminders/:id
    def update
      @reminder.update(reminder_params)
      head :no_content
    end

    # DELETE /reminders/:id
    def destroy
      @reminder.destroy
      head :no_content
    end

    private

    def reminder_params
      # whitelist params
      params.require(:reminder).permit(:description, :datetime, :city, :location_coordinates)
    end

    def set_reminder
      @reminder = Reminder.find(params[:id])
    end
  end
end
