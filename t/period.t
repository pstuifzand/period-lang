use Test::More;
use lib 'lib';
use Period;
use Data::Dumper;

my $p = Period->new;

my $e = $p->parse("!([2011-01-01,2012-06-01] during [2012-06-01,])");
ok($e->evaluate);

my $e = $p->parse("2011-01-01");
is($e, "2011-01-01");

my $e = $p->parse("(2011-01-01 between [2010-01-01,2012-01-01])");
ok($e->evaluate);

my $e = $p->parse("!(2011-01-01 between [2010-01-01,2012-01-01])");
ok(!$e->evaluate);

my $e = $p->parse("!(2014-01-01 between [2010-01-01,2012-01-01])");
ok($e->evaluate);

done_testing();
