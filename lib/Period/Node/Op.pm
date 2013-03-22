package Period::Node::Op;
use strict;

sub evaluate {
    my ($self, $names, $context) = @_;
    my ($p, $op, $q) = @$self;
    $p = $p->evaluate($names, $context);
    $q = $q->evaluate($names, $context);
    return $context->ops->call_op($op, $p, $q);
}

1;
