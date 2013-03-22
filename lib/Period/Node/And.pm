package Period::Node::And;

sub evaluate {
    my $self = shift;
    my $names = shift;
    my $context = shift;
    my ($l, $r) = @$self;
    $l = $l->evaluate($names, $context);
    $r = $r->evaluate($names, $context);
    return $l && $r;
}

1;
