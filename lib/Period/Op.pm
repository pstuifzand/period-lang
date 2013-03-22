package Period::Op;
use strict;
use 5.14.2;

sub new {
    my ($class) = @_;
    return bless { ops => {} }, $class;
}

sub register_op {
    my ($self, $name, $op) = @_;
    $self->{ops}{$name} = $op;
    return;
}

sub call_op {
    my ($self, $name, @args) = @_;
    die "$name operators does not exist" unless exists $self->{ops}{$name};
    return $self->{ops}{$name}->(@args);
}

1;
