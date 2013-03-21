package Period::Node::Not;

sub evaluate {
    my $self = shift;
    my $names = shift;
    return !$self->[0]->evaluate($names);
}

1;
