Geocoder.configure(
  # Geocoding options
  # timeout: 3,                 # geocoding service timeout (secs)
  lookup: :mapbox,            # name of geocoding service (symbol)
  # language: :en,              # ISO-639 language code
  # use_https: false,           # use HTTPS for lookup requests? (if supported)
  # http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
  # https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)
  api_key: 'pk.eyJ1IjoibWF4bWVyY3kiLCJhIjoiY2l3MXplMTRwMDhibDJ0cGNrY2QzbmZoayJ9.Ybq0sAYRjcEwrjeoMbP0Pg',           # API key for geocoding service
  # cache: nil,                 # cache object (must respond to #[], #[]=, and #keys)
  # cache_prefix: 'geocoder:',  # prefix (string) to use for all cache keys

  # Exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and Timeout::Error
  # always_raise: [],

  # Calculation options
   units: :km,                 # :km for kilometers or :mi for miles
  # distances: :linear          # :spherical or :linear
)
