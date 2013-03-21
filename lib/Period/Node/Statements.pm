package Period::Node::Statements;

sub evaluate {
    my $self = shift;
    my $names = shift;
    for (@$self) {
        $_->evaluate($names);
    }
    return 1;
}

1;
