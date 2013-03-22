package Period::Node::Between;

sub evaluate {
    my $self = shift;
    my $names = shift;

    my ($date, $p) = @$self;

    $date = $date->evaluate($names);
    $p    = $p->evaluate($names);

    return $date ge $p->from && $date lt $p->to;
}

1;
