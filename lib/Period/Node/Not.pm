package Period::Node::Not;

sub evaluate {
    my $self = shift;
    my $names = shift;
    my $context = shift;
    return !$self->[0]->evaluate($names, $context);
}

1;
