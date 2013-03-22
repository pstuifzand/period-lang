package Period::Node::Statements;
use strict;
use Data::Dumper;

sub evaluate {
    my $self = shift;
    my $names = shift;
    my $ret;
    for (@$self) {
        $ret = $_->evaluate($names);
    }
    return $ret;
}

1;
