package Period::Node::Overlaps;

sub evaluate {
    my $self = shift;
    my ($p1, $p2) = @$self;
    $p1 = $p1->evaluate($names);
    $p2 = $p2->evaluate($names);
    return $p1->from lt $p2->from && $p2->from lt $p1->to;
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
