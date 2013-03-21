package Period::Node::Between;

sub evaluate {
    my $self = shift;
    my $names = shift;

    my ($date, $p) = @$self;
    $date = (ref($date) ne 'Date::Simple') ? $date->evaluate($names) : $date;
    $p = $p->evaluate($names);

    return $date >= $p->from && $date < $p->to;
}

1;
