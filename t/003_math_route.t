use strict;
use warnings;

use dancerapp;
use Test::More tests => 5;
use Plack::Test;
use HTTP::Request::Common;
use Ref::Util qw<is_coderef>;

my $app = dancerapp->to_app;
ok( is_coderef($app), 'Got app' );

my $test = Plack::Test->create($app);
my $sum  = $test->request( GET '/math/sum/2/2' );

is( $sum->content, '4', '[GET /math/sum/2/2] successful' );

my $subtract  = $test->request( GET '/math/subtract/8/2' );
is( $subtract->content, '6', '[GET /math/subtract/8/2] successful' );

my $multiply  = $test->request( GET '/math/multiply/3/4' );
is( $multiply->content, '12', '[GET /math/multiply/3/4] successful' );

my $divide  = $test->request( GET '/math/divide/8/2' );
is( $divide->content, '4', '[GET /math/divide/8/2] successful' );
