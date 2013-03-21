package Period::Node::Between;

sub evaluate {
    my $self = shift;
    my ($date, $p) = @$self;
    $p = $p->evaluate;
    return $date >= $p->from && $date < $p->to;
}

1;
