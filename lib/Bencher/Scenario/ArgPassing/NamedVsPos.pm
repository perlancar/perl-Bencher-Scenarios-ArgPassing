package Bencher::Scenario::ArgPassing::NamedVsPos;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub named {
    my %args = @_;
}

sub positional {
    #my @args = @_;
}

our $scenario = {
    summary => 'Benchmark named vs positional argument passing',
    modules => {
    },
    participants => [
        {
            name => 'named',
            fcall_template => __PACKAGE__ . '::named(@{<named>})',
        },
        {
            name => 'positional',
            fcall_template => __PACKAGE__ . '::positional(@{<pos>})',
        },
    ],
    datasets => [
        {name => 'args=1' , args=>{named=>[a=>1], pos=>[1]}},
        {name => 'args=5' , args=>{named=>[a=>1,b=>2,c=>3,d=>4,e=>5], pos=>[1,2,3,4,5]}},
        {name => 'args=10', args=>{named=>[a=>1,b=>2,c=>3,d=>4,e=>5,f=>6,g=>7,h=>8,i=>9,j=>10], pos=>[1,2,3,4,5,6,7,8,9,10]}},
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
