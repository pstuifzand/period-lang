package Period::Node::After;

sub evaluate {
    my ($self, $names) = @_;
    my ($p, $q) = @$self;
    $p = $p->evaluate($names);
    $q = $q->evaluate($names);
    return $q->to lt $p->from;
}

1;
