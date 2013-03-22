package Period::Node::Var;
use strict;
use Data::Dumper;

sub evaluate {
    my $self = shift;
    my $names = shift;
    return $names->{$self->[0]}->evaluate($names);
}

1;
