package Period::Node::Overlaps;

sub evaluate {
    my $self = shift;
    my ($p1, $p2) = @$self;
    return $p1->from < $p2->from && $p2->from < $p1->to;
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
