class DataController < ApplicationController
@data = File.read("/app/assets/javascript/youtho_index_main_metrics.json")

def index
  render :json => @data
 end
end

#= http://stackoverflow.com/questions/11149430/how-to-serve-a-static-json-file-in-rails
