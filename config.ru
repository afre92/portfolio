use Rack::SSL if ENV['FORCE_SSL'] == '1'
use Rack::Static,
  :urls => ["/img","/css","/js","/scss","/vendor"],
  :root => "public"

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
