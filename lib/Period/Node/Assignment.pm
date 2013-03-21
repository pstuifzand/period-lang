package Period::Node::Assignment;

sub evaluate {
    my ($self, $names) = @_;
    my ($var, $expr) = @$self;
    $names->{$var} = $expr;
    return 1;
}

1;
