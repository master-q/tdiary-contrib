#
# ja/nicovideo.rb - Japanese resource
#
# Copyright (C) TADA Tadashi <sho@spc.gr.jp>
# Distributed under GPL.
#

def nicovideo_player_path
	'http://www.nicovideo.jp'
end

def nicovideo_feed( i )
	<<-HTML
		<table border="0" cellpadding="4" cellspacing="0" summary="#{h i[:title]}"><tr valign="top">
		<td><a href="#{i[:url]}"><img alt="#{h i[:title]}" src="#{i[:thumb]}" width="130" height="100" style="border:solid 1px #333;"></a></td>
		<td width="100%"><a href="#{i[:url]}"><strong>#{h i[:title]}</strong></a> (#{i[:length]})<br>#{i[:desc]}</td>
		</tr></table>
	HTML
end

def nicovideo_html( i )
	<<-HTML
		<table border="0" cellpadding="4" cellspacing="0" summary="#{h i[:title]}" style="margin-left:0em;">
		<tr valign="top">
		<td style="font-size:70%;border-width:0px;">
		<div style="margin:4px 0px;"><a href="#{i[:url]}"><img alt="#{h i[:title]}" src="#{i[:thumb]}" width="130" height="100" style="border:solid 1px #333;"></a></div>
		<p><strong>#{i[:date][0,10]}</strong><br>
		再生: <strong>#{i[:view].scan(/\d+?(?=\d{3}*$)/).join(",")}</strong><br>
		コメント: <strong>#{i[:comment_num].scan(/\d+?(?=\d{3}*$)/).join(",")}</strong><br>
		マイリスト: <strong>#{i[:mylist].scan(/\d+?(?=\d{3}*$)/).join(",")}</strong></p>
		</td>
		<td width="100%" style="font-size:80%;border-width:0px;">
		<p><a href="#{i[:url]}" class="video"><strong>#{h i[:title]}</strong></a> (#{i[:length].split(/:/).map{|j|'%02d' % j.to_i}.join(':')})<br>#{i[:desc]}</p>
		<div style="background:#FFF; border:solid 2px #CCC; padding:6px; margin-top:4px;">
		<p><strong>#{i[:comment]}</strong></p>
		</div>
		</td>
		</tr>
		</table>
	HTML
end
