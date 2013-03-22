package Period::Context;
use strict;
use Period::Op;

sub new {
    my ($class) = @_;
    my $self = bless {}, $class;
    $self->{ops} = Period::Op->new;
    $self->ops->register_op('after', sub {
        my ($p, $q) = @_;
        return $q->to lt $p->from;
    });
    $self->ops->register_op('before', sub {
        my ($p, $q) = @_;
        return $p->to lt $q->from;
    });
    $self->ops->register_op('during', sub {
        my ($p, $q) = @_;
        return $q->from lt $p->from && $p->to lt $q->to;
    });
    $self->ops->register_op('overlaps', sub {
        my ($p, $q) = @_;
        return $p->from lt $q->from && $q->from lt $p->to;
    });
    $self->ops->register_op('meets', sub {
        my ($p, $q) = @_;
        return $p->to eq $q->from;
    });

    $self->ops->register_op('starts', sub {
        my ($p, $q) = @_;
        return $p->from eq $q->from && $p->to lt $q->to;
    });
    $self->ops->register_op('finishes', sub {
        my ($p, $q) = @_;
        return $q->from lt $p->from && $p->to eq $q->to;
    });
    return $self;
}

sub ops {
    my $self = shift;
    return $self->{ops};
}

1;
