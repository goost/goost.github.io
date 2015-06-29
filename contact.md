---
title: Contact
permalink: /contact/
author: goost
layout: page
---

<div class="row section">
	<div class="container narrow block">
		<div class="col-1-2">
		<p>You want to contact me? Ask me question? Tell me a interesting story? Great! Just shoot me an email: <a href="mailto:askme@pgunited.com">askme[at]pgunited.com</a> or use the form (powered by <a href="http://formspree.io">formspree.io</a>).</p>
		</div>
		<div class="col-1-2">
			<form method="POST" action="//formspree.io/askme@pgunited.com">
		    	<input type="email" name="_replyto" placeholder="Your email">
				<textarea name="message" rows="5" placeholder="Your message"></textarea>
				<input type="submit" value="Send">
				<input type="hidden" name="_next" value="{{ site.url }}/impressum_send">
				<input type="hidden" name="_subject" value="PG United - Contact through contact form">
				<input type="text" name="_gotcha" style="display:none">
			</form> 
		</div>
	</div>
</div>