package Period::Node::During;
use strict;
use 5.14.2;
use Data::Dumper;

sub evaluate {
    my $self = shift;
    my $names = shift;
    my ($p, $q) = @$self;
    $p = $p->evaluate($names);
    $q = $q->evaluate($names);
    return $q->from lt $p->from && $p->to le $q->to;
}

1;

