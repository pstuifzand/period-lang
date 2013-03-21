package Period::Node::Meets;

sub evaluate {
    my $self = shift;
    my ($p1, $p2) = @$self;
    return $p1->to == $p2->from;
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
