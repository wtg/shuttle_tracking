module ApplicationHelper

  # Generates html for a div for use as a map canvas.
  # Defaults to a small div that works well for showing 1 or 2 points 
  # that are in close proximity to each other.
  def map_canvas(options = {})
    options[:id] ||= "map_canvas"
    options[:style] ||= "width: 250px; height: 250px;"
    tag("div", options, true) + raw("</div>")
  end

  # Generates a KML color given a hex color string.
  # Converts the format from #RRGGBB to AABBGGRR.
  # The alpha channel defaults to ff.
  def to_kmlcolor(color="#000000", alpha = "ff")
    alpha + color[5,3].to_s + color[3,2].to_s + color[1,2].to_s
  end

end
