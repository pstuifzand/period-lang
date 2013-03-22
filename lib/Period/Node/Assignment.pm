package Period::Node::Assignment;
use strict;

sub evaluate {
    my ($self, $names, $context) = @_;
    my ($var, $expr) = @$self;
    confess("") unless defined $names;
    $names->{$var} = $expr;
    return 1;
}

1;
