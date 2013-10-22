package Item;

use Moo;
use Types::Standard qw( Str );

has description => (
    is => 'ro',
    isa => Str,
);

1;
