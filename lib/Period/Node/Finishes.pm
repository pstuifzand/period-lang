package Period::Node::Finishes;

sub evaluate {
    my ($self, $names) = @_;
    my ($p, $q) = @$self;
    $p = $p->evaluate($names);
    $q = $q->evaluate($names);
    return $q->from lt $p->from && $p->to eq $q->to;
}

1;
