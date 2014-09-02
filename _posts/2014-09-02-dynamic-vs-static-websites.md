---
layout: post
published: false
title: Dynamic vs Static Websites
mathjax: false
featured: false
comments: true
chart: false
categories: 
  - webdevelopment
---

Dynamic websites generate content live per each request. The request is delegated to a running web-application that builds the content. For example, WordPress is a popular dynamic web-application framework written in PHP. WordPress is installed on your website's hosting server and needs PHP and a MySQL database to run. WordPress sends web requests to templates responsible for generating web pages on demand. Templates execute conditional logic, access other files, and make database queries to generate the final page content. The more code, files, and database queries required the more expensive it is for your server.

![wordpress.jpg](/images/post/wordpress.jpg)

WordPress can be sped up using the WP Super Cache plugin.

The WP Super Cache plugin works with the web-server to completely bypass the WordPress application environment. Requests are much faster because PHP is no longer executed nor is the database queried. The WP Super Cache plugin works with the web-server to completely bypass the WordPress application environment. 



Requests are much faster because PHP is no longer executed nor is the database queried. WP Super Cache works by using WordPress to pre-build every page of your website. Instead of WordPress serving the dynamic content, WP Super Cache stores the result as a static HTML file. WP Super Cache instructs the web-server to look first in the cached-website folder and serve that page directly. The entire WordPress application is completely bypassed! 



The web application is no longer relied upon for expensive conditional logic or database transactions. The cached version of the website is a static website because the web-server serves the cached page files to the user directly from the file-system. Serving a static website only requires the website's pages be pre-built and stored on the server's filesystem. The web-server can then serve these files directly. 

### Does the entire application even need to be on the server?

WP Super Cache runs WordPress on the server to pre-generate the website pages. But that means your server needs to run PHP and a MySQL database which is more costly and resource intensive than a static file server. Web page files can be generated anywhere, then uploaded to the server.

A static website generator is a program that generates static websites in a completely standalone way. There are many static website generator's made in a variety of programming languages. Your personal computer can run Static website generators.

![staticwebsite.jpg](/images/post/staticwebsite.jpg)

But this implies your computer must be setup to run a programming language like PHP, Ruby, Javascript, and maybe even a database. This might not always be possible, especially for non-technical users. Static Website Generation as a Service.

A static website generator service allows you to upload templates via their website which they process for you. You can use your own text-editor or web browser interface to edit and upload your templates to the service. The website generation service publishes your site by uploading the generated files to a static file server for hosting. Static File Servers are extremely fast, can handle tons of traffic, and fail much less often.