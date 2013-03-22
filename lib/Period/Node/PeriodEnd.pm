package Period::Node::PeriodEnd;

sub evaluate {
    my $self = shift;
    my $names = shift;

    return bless [ 
        $self->from,
        $self->to->evaluate($names),
    ], 'Period::Node::Period';
}

sub from {
    my $self = shift;
    return '0000-00-00';
}

sub to {
    my $self = shift;
    return $self->[0];
}


1;
