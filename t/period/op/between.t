use Test::More;
use lib 'lib';
use Period;
use Data::Dumper;

my $p = Period->new;

my $e = $p->parse("2011-01-01 between [2011-01-01,2011-01-02]");
ok($e->evaluate({}));

my $e = $p->parse("2011-02-01 between [2011-01-01,2011-01-02]");
ok(!$e->evaluate({}));

my $e = $p->parse("2011-02-01 between [2011-01-31,2011-01-31]");
ok(!$e->evaluate({}));

done_testing();
