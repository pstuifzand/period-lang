use Test::More;
use lib 'lib';
use Period;
use Data::Dumper;

my $p = Period->new;

{
    my $e = $p->parse(<<"TEST");
p = [2012-01-01,];
q = [2013-12-01,2013-12-31];
!p before q;
TEST
    my $names = {};
    ok($e->evaluate($names));
}

{
    my $e = $p->parse(<<"TEST");
p = [2012-01-01,2012-02-01];
q = [2013-12-01,2013-12-31];
p before q;
TEST
    my $names = {};
    ok($e->evaluate($names));
}

done_testing();