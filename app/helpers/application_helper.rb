module ApplicationHelper

  # Generates html for a div for use as a map canvas.
  # Defaults to a small div that works well for showing 1 or 2 points 
  # that are in close proximity to each other.
  def map_canvas(options = {})
    options[:id] ||= "map_canvas"
    options[:style] ||= "width: 250px; height: 250px;"
    tag("div", options, true) + raw("</div>")
  end

end
