package Period;
use 5.14.2;
use strict;
use Marpa::R2;

use Period::Node::Overlaps;
use Period::Node::Period;
use Period::Node::Not;
use Period::Node::Meets;
use Period::Node::During;
use Period::Node::Between;

sub new {
    my ($class) = @_;
    my $self = bless {
        grammar => Marpa::R2::Scanless::G->new({

            action_object  => 'Period::Actions',
            default_action => '::array',
            bless_package  => 'Period::Node',
            source         => \<<'SOURCE',

:start  ::= expression

expression ::= period                                   action => ::first
             | ldate                                    action => ::first
             | var                                      action => ::array bless => Var
             | bool_expression                          action => ::first

ldate      ::= date                                     action => do_date

bool_expression ::=
               period_bool_expression                   action => ::first
             | ('(') bool_expression (')')              action => ::first
             | ('!') bool_expression                    bless => Not
             | bool_expression '&&' bool_expression     bless => And
             | bool_expression '||' bool_expression     bless => Or
             | ldate ('between') expression              bless => Between

period_bool_expression ::=
               expression ('meets') expression          bless => Meets
             | expression ('equals') expression         bless => Equals
             | expression ('before') expression         bless => Before
             | expression ('after') expression          bless => After
             | expression ('starts') expression         bless => Starts
             | expression ('finishes') expression       bless => Finishes
             | expression ('overlaps') expression       bless => Overlaps
             | expression ('during') expression         bless => During

period     ::= ('[') ldate (',') ldate (']')              bless => Period
             | ('[') (',') ldate (']')                   bless => Period
             | ('[') ldate (',') (']')                   bless => Period

date       ~ year '-' month '-' day
year       ~ [\d] [\d] [\d] [\d] 
month      ~ [\d] [\d]
day        ~ [\d] [\d]

var        ~ [\w]+

:discard   ~ whitespace
whitespace ~ [\s]+

SOURCE
        }),
    }, $class;
    return $self;
}

sub parse {
    my ($self, $input) = @_;
    my $re = Marpa::R2::Scanless::R->new({ grammar => $self->{grammar} });
    $re->read(\$input);
    my $t = $re->value;
    return $$t;
}

package Period::Actions;
use strict;
use Date::Simple 'date';

sub new {
    my $class = shift;
    return bless {}, $class;
}

sub do_operator {
    my ($self, $left, $op, $right) = @_;
    return [ $op, $left, $right ];
}

sub do_date {
    my ($self, $date) = @_;
    return date($date);
}

1;
