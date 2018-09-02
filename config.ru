require 'rack/ssl'


use Rack::Static,
  :urls => ["/img","/css","/js","/scss","/vendor"],
  :root => "public"

use Rack::SSL

run lambda { |env|
  [
    200,
    {
      'Content-Type' => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/index.html', File::RDONLY)
  ]
}
