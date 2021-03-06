package Period::Node::Period;
use strict;

sub evaluate {
    my $self = shift;
    my $names = shift;
    return bless [ 
        $self->[0]->evaluate($names),
        $self->[1]->evaluate($names),
    ], 'Period::Node::Period';
}

sub from {
    my $self = shift;
    return $self->[0];
}

sub to {
    my $self = shift;
    return $self->[1];
}

1;
