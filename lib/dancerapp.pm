package dancerapp;
use Dancer2;
use Dancer2::Plugin::Redis;

our $VERSION = '0.1';

get '/' => sub {
    template 'index' => { 'title' => 'dancerapp' };
};

get '/hello/:name' => sub {
    return "Why, hello there " . param('name');
};

get '/math/sum/:num1/:num2' => sub {
    my $num1 = param('num1');
    my $num2 = param('num2');
    return $num1 + $num2;
};

get '/math/subtract/:num1/:num2' => sub {
    my $num1 = param('num1');
    my $num2 = param('num2');
    return $num1 - $num2;
};

get '/math/multiply/:num1/:num2' => sub {
    my $num1 = param('num1');
    my $num2 = param('num2');
    return $num1 * $num2;
};

get '/math/divide/:num1/:num2' => sub {
    my $num1 = param('num1');
    my $num2 = param('num2');
    return $num1 / $num2;
};

#my $redis = Redis->new(
#    server    => 'redis://172.17.0.2:6379/',  # Redis server hostname or IP address and port
#    reconnect => 10,                          # Reconnect timeout in seconds (optional)
#);

# Sample Dancer2 route to connect to Redis and perform operations
get '/redis-example' => sub {
    # Perform Redis operations
    redis_set('mykey', 'myvalue');
    my $value = redis_get('mykey');

    return "Value from Redis: $value";
};

true;
