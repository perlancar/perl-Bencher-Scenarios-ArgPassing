package Bencher::Scenario::ArgPassing::Mixed;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub hashref_at_the_front {
    my $named = shift;
    my ($pos1, $pos2, $pos3) = @_;
}

sub opt_hashref_at_the_front {
    my $named = ref($_[0]) eq 'HASH' ? shift : {};
    my ($pos1, $pos2, $pos3) = @_;
}

sub list_then_hash {
    my $pos0 = shift;
    my $pos1 = shift;
    my $pos2 = shift;
    my %named = @_;
}

our $scenario = {
    summary => 'Benchmark argument passing (mixed positional and named)',
    description => <<'_',

This scenario compares three style of passing mixed positional and named
arguments:

    # hashref at the front
    func({named1=>1, named2=>2}, 'pos0', 'pos1', 'pos2');

    # optional hashref at the front. like the above but when there are no named
    # arguments, the hashref can be omitted
    func({named1=>1, named2=>2}, 'pos0', 'pos1', 'pos2');

    # positional then named as hash
    func('pos1', 'pos2', 'pos3', named1=>1, named2=>2);

_
    modules => {
    },
    participants => [
        {
            name => 'hashref_at_the_front',
            fcall_template => __PACKAGE__ . '::hashref_at_the_front(<named>, <pos1>, <pos2>, <pos3>)',
        },
        {
            name => 'opt_hashref_at_the_front',
            fcall_template => __PACKAGE__ . '::opt_hashref_at_the_front(<named>, <pos1>, <pos2>, <pos3>)',
        },
        {
            name => 'list_then_hash',
            fcall_template => __PACKAGE__ . '::list_then_hash(<pos1>, <pos2>, <pos3>, %{<named>})',
        },
    ],
    datasets => [
        {name => 'pos=3 named=1', args=>{pos1=>1, pos2=>2, pos3=>3, named=>{a=>1}}},
        {name => 'pos=3 named=5', args=>{pos1=>1, pos2=>2, pos3=>3, named=>{a=>1, b=>2, c=>3, d=>4, e=>5}}},
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
