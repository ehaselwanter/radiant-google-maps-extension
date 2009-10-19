require File.dirname(__FILE__) + '/../spec_helper'

describe "The Google Maps Tag" do

  dataset :google_maps_tags

  before(:each) do
    page(:map)
  end

  it '<r:google_map:header /> should render the header' do
  page.should render('<r:google_map:header />').as('<script src="http://maps.google.com/maps?file=api&amp;v=2.x&amp;key=ABQIAAAAzMUFFnT9uH0xq39J0Y4kbhTJQa0g3IQ9GZqIMmInSLzwtGDKaBR6j135zrztfTGVOm2QlWnkaidDIQ&amp;hl=" type="text/javascript"></script>
<script src="/javascripts/ym4r-gm.js" type="text/javascript"></script>
<style type="text/css">
 v:* { behavior:url(#default#VML);}
</style>')
  end

  it "<r:google_map:generate name='parent' /> (no div specified) should throw an exception" do
    page.should render("<r:google_map:generate name='parent' />").with_error("`google_map:generate' tag must contain a `div' attribute.")
  end


  it "<r:google_map:generate div='mapDiv'/> (no map id or name specified) )should thrown an exception" do
    page.should render("<r:google_map:generate div='mapDiv' />").with_error("`google_map:generate' tag must contain a `name' or 'id' attribute.")
  end
  
  it "<r:google_map:generate div='mapDiv'/> with invalid map id or name should throw an exception" do
    page.should render("<r:google_map:generate div='mapDiv' id='500' />").with_error("No map found with ID: 500")
    page.should render("<r:google_map:generate div='mapDiv' name='nonexistant' />").with_error("No map found with name: nonexistant")
  end

  it "<r:google_map:generate div='mapDiv' name='parent' /> (valid map name) should render the google map" do
    page.should render("<r:google_map:generate name='parent' div='mapDiv' />").as('<script type="text/javascript">
var map;
window.onload = addCodeToFunction(window.onload,function() {
if (GBrowserIsCompatible()) {
map = new GMap2(document.getElementById("mapDiv"));
map.setCenter(new GLatLng(0.0,0.0),15);map.setMapType(G_NORMAL_MAP);
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(1.0,1.0),{title : "First Marker"}),"<p>test</p>",{}));
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(2.0,2.0),{title : "Markdown Marker"}),"<p><strong>markdown</strong></p>",{}));
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(4.0,4.0),{title : "Radius Marker"}),"test",{}));
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(3.0,3.0),{title : "Textile Marker"}),"<p><em>textile</em></p>",{}));map.addControl(new GLargeMapControl());
map.addControl(new GMapTypeControl());
}
});
</script>')
  end

  it "<r:google_map:generate div='mapDiv' id='1' /> (valid map id) should render the google map" do
    page.should render("<r:google_map:generate name='parent' div='mapDiv' />").as('<script type="text/javascript">
var map;
window.onload = addCodeToFunction(window.onload,function() {
if (GBrowserIsCompatible()) {
map = new GMap2(document.getElementById("mapDiv"));
map.setCenter(new GLatLng(0.0,0.0),15);map.setMapType(G_NORMAL_MAP);
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(1.0,1.0),{title : "First Marker"}),"<p>test</p>",{}));
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(2.0,2.0),{title : "Markdown Marker"}),"<p><strong>markdown</strong></p>",{}));
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(4.0,4.0),{title : "Radius Marker"}),"test",{}));
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(3.0,3.0),{title : "Textile Marker"}),"<p><em>textile</em></p>",{}));map.addControl(new GLargeMapControl());
map.addControl(new GMapTypeControl());
}
});
</script>')
  end

  it "<r:google_map:generate div='mapDiv' name='parent' marker_name='first' /> (valid map and marker name) should render the google map centered and zoomed on the marker" do
    page.should render("<r:google_map:generate name='parent' div='mapDiv' marker_name='first' />").as('<script type="text/javascript">
var map;
window.onload = addCodeToFunction(window.onload,function() {
if (GBrowserIsCompatible()) {
map = new GMap2(document.getElementById("mapDiv"));
map.setCenter(new GLatLng(1.0,1.0),5);map.setMapType(G_NORMAL_MAP);
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(1.0,1.0),{title : "First Marker"}),"<p>test</p>",{}));
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(2.0,2.0),{title : "Markdown Marker"}),"<p><strong>markdown</strong></p>",{}));
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(4.0,4.0),{title : "Radius Marker"}),"test",{}));
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(3.0,3.0),{title : "Textile Marker"}),"<p><em>textile</em></p>",{}));map.addControl(new GLargeMapControl());
map.addControl(new GMapTypeControl());
}
});
</script>')
  end

  it "<r:google_map:generate div='mapDiv' name='parent' marker_id='1' /> (valid map and marker id) should render the google map centered and zoomed on the marker" do
    page.should render("<r:google_map:generate name='parent' div='mapDiv' marker_id='1' />").as('<script type="text/javascript">
var map;
window.onload = addCodeToFunction(window.onload,function() {
if (GBrowserIsCompatible()) {
map = new GMap2(document.getElementById("mapDiv"));
map.setCenter(new GLatLng(1.0,1.0),5);map.setMapType(G_NORMAL_MAP);
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(1.0,1.0),{title : "First Marker"}),"<p>test</p>",{}));
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(2.0,2.0),{title : "Markdown Marker"}),"<p><strong>markdown</strong></p>",{}));
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(4.0,4.0),{title : "Radius Marker"}),"test",{}));
map.addOverlay(addInfoWindowToMarker(new GMarker(new GLatLng(3.0,3.0),{title : "Textile Marker"}),"<p><em>textile</em></p>",{}));map.addControl(new GLargeMapControl());
map.addControl(new GMapTypeControl());
}
});
</script>')
  end

  it "<r:google_map:generate div='mapDiv' name='parent' marker_name='nonexistant' /> (invalid marker name) should throw an exception" do
    page.should render("<r:google_map:generate div='mapDiv' name='parent' marker_name='nonexistant' />").with_error('No marker found with name: nonexistant')
  end



  it "<r:google_map:generate div='mapDiv' name='parent' marker_id='500' /> (invalid marker id) should throw an exception" do
    page.should render("<r:google_map:generate div='mapDiv' name='parent' marker_id='500' />").with_error('No marker found with ID: 500')
  end

  private

  def page(symbol = nil)
    if symbol.nil?
      @page ||= pages(:assorted)
    else
      @page = pages(symbol)
    end
  end
end


