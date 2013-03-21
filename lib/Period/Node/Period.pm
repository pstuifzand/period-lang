package Period::Node::Period;

sub evaluate {
    return $_[0];
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
