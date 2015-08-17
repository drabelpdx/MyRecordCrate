class Artist < ActiveRecord::Base

  @artists = @artists.paginate(:page => params[:page])

  respond_to do |format|
    format.json {
      render :json => {
        :current_page => @artists['pagination'].current_page,
        :per_page => @artists['pagination'].per_page,
        :total_pages => @artists['pagination'].pages,
        :total_entries => @artists['pagination'].items,
        :entries => @artists
      }
    }
  end

end
