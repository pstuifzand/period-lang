use strict;
use Test::More;
use lib 'lib';
use Period;
use Data::Dumper;

my $p = Period->new;
my $context = Period::Context->new;

my $e = $p->parse("!([2011-01-01,2012-06-01] during [2012-06-01,])");
ok($e->[0]->evaluate({},$context));

my $e = $p->parse("2011-01-01");
is($e->[0]->evaluate({},$context), "2011-01-01");

my $e = $p->parse("(2011-01-01 between [2010-01-01,2012-01-01])");
ok($e->[0]->evaluate({},$context));

my $e = $p->parse("!(2011-01-01 between [2010-01-01,2012-01-01])");
ok(!$e->[0]->evaluate({},$context));

my $e = $p->parse("!(2014-01-01 between [2010-01-01,2012-01-01])");
ok($e->[0]->evaluate({},$context));

my $e = $p->parse("d = 2012-01-01");
my $names = {};
ok($e->[0]->evaluate($names,$context));
is($names->{d}->evaluate($names,$context), '2012-01-01');

my $e = $p->parse("d = 2011-01-01; p = [2010-01-01,2012-01-01]; d between p");
my $names = {};
is($e->evaluate($names), 1);
is($names->{d}->evaluate($names,$context), '2011-01-01');
is($names->{p}->from->evaluate($names,$context), '2010-01-01');
is($names->{p}->to->evaluate($names,$context), '2012-01-01');

my $e = $p->parse("d = 2014-01-01; d between [2010-01-01,2012-01-01] || d between [2012-01-01,2050-01-01]");
ok($e->evaluate({}, $context));

done_testing();
