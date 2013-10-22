package Order;

use Moo;
use MooX::HandlesVia;
use Types::Standard qw( Str HashRef ArrayRef);
use Type::Utils qw( class_type );

my $item_class = class_type { class => 'Item' };

has order_id => (
    is => 'ro',
    isa => Str,
    required => 1,
);

has items => (
    is => 'rw',
    isa => ArrayRef[$item_class],
    default => sub { [] },
    handles_via  => 'Array',
    handles => {
        add_item  => 'push',
        get_items => 'elements',
    },
);

1;
