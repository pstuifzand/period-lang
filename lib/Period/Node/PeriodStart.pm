package Period::Node::PeriodStart;

sub evaluate {
    my $self = shift;
    my $names = shift;

    return bless [ 
        $self->from->evaluate($names),
        $self->to,
    ], 'Period::Node::Period';
}

sub from {
    my $self = shift;
    return $self->[0];
}

sub to {
    my $self = shift;
    return '9999-12-31';
}

1;

