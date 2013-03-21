package Period::Node::Not;

sub evaluate {
    my $self = shift;
    return !$self->[0]->evaluate();
}

1;
