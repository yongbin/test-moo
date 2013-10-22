use Test::Most;

use_ok 'Person';
use_ok 'Order';
use_ok 'Item';

{
    ok my $fred = Person->new(name => 'fred');
    is $fred->name, 'fred';
    # handles_via Array methods
    can_ok($fred,('add_order', 'get_orders'));

    ok my $order1 = Order->new(order_id => 'fred1');
    is $order1->order_id, 'fred1';
    # handles_via Array methods
    can_ok($order1,('add_item', 'get_items'));

    ok my $item = Item->new(description => 'teddy');
    is $item->description, 'teddy';
    ok $order1->add_item($item);
    isa_ok($_,'Item') for $order1->get_items;
    is_deeply $order1->items->[0],$item;

    $fred->add_order($order1);
    isa_ok($_,'Order') for $fred->get_orders;
    is_deeply $fred->orders->[0],$order1;
}

{
    my $fred = Person->new(name => 'fred');
    my $order1 = Order->new(order_id => 'fred1');
    my $item = Item->new(description => 'teddy');

    # below codes should runtime fail by type constaints check -yyb
    $fred->add_order($item);
    $order1->add_item($fred);

    isa_ok($_,'Item') for $order1->get_items;
    isa_ok($_,'Order') for $fred->get_orders;
}

done_testing();
