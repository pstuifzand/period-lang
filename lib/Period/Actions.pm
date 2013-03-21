package Period::Actions;
use strict;

sub new {
    my $class = shift;
    return bless {}, $class;
}

sub do_period {
    my ($self, $from, $to) = @_;
    return { from => $from, to => $to };
}

1;
