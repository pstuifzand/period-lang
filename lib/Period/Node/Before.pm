package Period::Node::Before;

sub evaluate {
    my ($self, $names) = @_;
    my ($p, $q) = @$self;
    $p = $p->evaluate($names);
    $q = $q->evaluate($names);
    return $p->to lt $q->from;
}

1;
