use Test::More;
use lib 'lib';
use Period;
use Data::Dumper;

my $p = Period->new;

my $e = $p->parse("!([2011-01-01,2012-06-01] during [2012-06-01,])");
ok($e->[0]->evaluate);

my $e = $p->parse("2011-01-01");
is($e->[0], "2011-01-01");

my $e = $p->parse("(2011-01-01 between [2010-01-01,2012-01-01])");
ok($e->[0]->evaluate);

my $e = $p->parse("!(2011-01-01 between [2010-01-01,2012-01-01])");
ok(!$e->[0]->evaluate);

my $e = $p->parse("!(2014-01-01 between [2010-01-01,2012-01-01])");
ok($e->[0]->evaluate);

my $e = $p->parse("d = 2012-01-01");
my $names = {};
ok($e->[0]->evaluate($names));
is($names->{d}, '2012-01-01');

my $e = $p->parse("d = 2011-01-01; p = [2010-01-01,2012-01-01]; d between p");
my $names = {};
ok($e->evaluate($names));
is($names->{d}, '2011-01-01');
is($names->{p}->from, '2010-01-01');
is($names->{p}->to, '2012-01-01');

done_testing();
