package Period::Node::Between;
use Data::Dumper;

sub evaluate {
    my $self = shift;
    my $names = shift;

    my ($date, $p) = @$self;

    $date = $date->evaluate($names);
    $p    = $p->evaluate($names);

    return $p->from le $date && $date lt $p->to;
}

1;
