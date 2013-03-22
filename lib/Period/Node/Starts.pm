package Period::Node::Starts;

sub evaluate {
    my ($self, $names) = @_;
    my ($p, $q) = @$self;
    $p = $p->evaluate($names);
    $q = $q->evaluate($names);
    return $p->from eq $q->from && $p->to lt $q->to;
}

1;
