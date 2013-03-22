package Period;
use 5.14.2;
use strict;
use Marpa::R2;
use Data::Dumper;

use Period::Node::Period;
use Period::Node::PeriodStart;
use Period::Node::PeriodEnd;

use Period::Node::Not;
use Period::Node::Var;
use Period::Node::Date;

use Period::Node::Between;

use Period::Node::Meets;
use Period::Node::During;
use Period::Node::Overlaps;

use Period::Node::Before;
use Period::Node::After;

use Period::Node::Starts;
use Period::Node::Finishes;

use Period::Node::Assignment;
use Period::Node::Statements;

sub new {
    my ($class) = @_;
    my $self = bless {
        grammar => Marpa::R2::Scanless::G->new({
            default_action => '::array',
            bless_package  => 'Period::Node',

            source         => \<<'SOURCE',

:start  ::= statements

statements  ::= statement+                              separator => semicolon proper => 0 bless => Statements

statement   ::= var ('=') expression                    bless => Assignment
              | expression                              action => ::first

semicolon    ~ ';'

expression ::= period                                   action => ::first
             | ldate                                    action => ::first
             | var                                      action => ::array bless => Var
             | bool_expression                          action => ::first

ldate      ::= date                                     bless => Date

bool_expression ::=
               period_bool_expression                   action => ::first
             | ('(') bool_expression (')')              action => ::first
             | ('!') bool_expression                    bless => Not
             | bool_expression '&&' bool_expression     bless => And
             | bool_expression '||' bool_expression     bless => Or
             | expression ('between') expression        bless => Between

period_bool_expression ::=
               expression ('meets') expression          bless => Meets
             | expression ('equals') expression         bless => Equals
             | expression ('before') expression         bless => Before
             | expression ('after') expression          bless => After
             | expression ('starts') expression         bless => Starts
             | expression ('finishes') expression       bless => Finishes
             | expression ('overlaps') expression       bless => Overlaps
             | expression ('during') expression         bless => During

period     ::= ('[') ldate (',') ldate (']')            bless => Period
             | ('[') (',') ldate (']')                  bless => PeriodEnd
             | ('[') ldate (',') (']')                  bless => PeriodStart

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

1;
