use Test::More;
use lib 'lib';
use Period;
use Data::Dumper;

my $p = Period->new;
my $context = Period::Context->new;

my $e = $p->parse("!([2011-01-01,2012-06-01] during [2011-01-01,2012-06-01])");
ok($e->[0]->evaluate({}, $context));

my $e = $p->parse("!([2011-01-01,2012-06-01] during [2012-06-01,])");
ok($e->[0]->evaluate({}, $context));

my $e = $p->parse("([2011-01-01,2012-05-31] during [,2012-06-01])");
ok($e->[0]->evaluate({}, $context));

done_testing();
