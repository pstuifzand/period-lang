package Period::Node::During;

sub evaluate {
    my $self = shift;
    my ($p, $q) = @$self;
    return $q->from < $p->from && $p->from < $q->to;
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
