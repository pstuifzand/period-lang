package Period::Node::Var;
use Data::Dumper;

sub evaluate {
    my $self = shift;
    my $names = shift;
    return $names->{$self->[0]};
}

1;
