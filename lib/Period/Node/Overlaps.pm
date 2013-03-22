package Period::Node::Overlaps;
use strict;

sub evaluate {
    my $self = shift;
    my $names = shift;
    my ($p, $q) = @$self;
    $p = $p->evaluate($names);
    $q = $q->evaluate($names);
    return $p->from lt $q->from && $q->from lt $p->to;
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
