package Period::Node::Date;
use strict;
use 5.14.2;
use Data::Dumper;

sub evaluate {
    my $self = shift;
    return $self->[0];
}

1;
