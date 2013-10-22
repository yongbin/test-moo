package Person;

use Moo;
use MooX::HandlesVia;
use Types::Standard qw( Str ArrayRef);
use Type::Utils qw( class_type );

my $order_class = class_type { class => 'Order' };

has name => (
    is => 'ro',
    isa => Str,
    required => 1,
);

has orders => (
    is => 'rw',
    isa => ArrayRef[$order_class],
    default => sub { [] },
    handles_via  => 'Array',
    handles => {
        add_order  => 'push',
        get_orders => 'elements',
    },
);

1;
