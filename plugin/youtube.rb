#
# youtube.rb: YouTube plugin for tDiary
#
# Copyright (C) 2010 by TADA Tadashi <t@tdtds.jp>
#
# usage: <%= youtube 'VIDEO_ID' %>
#
def youtube( video_id, size = [425,350] )
	if @conf.mobile_agent? or @conf.iphone? or feed? then
		%Q|<div class="youtube"><a href="http://www.youtube.com/watch?v=#{video_id}">YouTube (#{video_id})</a></div>|
	elsif defined?( :iphone? ) and iphone?
		%Q|<div class="youtube"><a href="youtube:#{video_id}">YouTube (#{video_id})</a></div>|
	else
		<<-TAG
		<object class="youtube" width="#{size[0]}" height="#{size[1]}"><param name="movie" value="http://www.youtube.com/v/#{video_id}"><embed src="http://www.youtube.com/v/#{video_id}" type="application/x-shockwave-flash" width="#{size[0]}" height="#{size[1]}"></embed></object>
		TAG
	end
end
