-- Tags: no-fasttest

set allow_experimental_json_type=1;
drop table if exists test;
create table test (json JSON) engine=Memory;
replace table test (json JSON(max_dynamic_paths=10)) engine=Memory;
replace table test (json JSON(max_dynamic_types=10)) engine=Memory;
replace table test (json JSON(a UInt32)) engine=Memory;
replace table test (json JSON(aaaaa UInt32)) engine=Memory;
replace table test (json JSON(`a b c d` UInt32)) engine=Memory;
replace table test (json JSON(a.b.c UInt32)) engine=Memory;
replace table test (json JSON(aaaa.b.cccc UInt32)) engine=Memory;
replace table test (json JSON(`some path`.`path some` UInt32)) engine=Memory;
replace table test (json JSON(a.b.c Tuple(d UInt32, e UInt32))) engine=Memory;
replace table test (json JSON(SKIP a)) engine=Memory;
replace table test (json JSON(SKIP aaaa)) engine=Memory;
replace table test (json JSON(SKIP `a b c d`)) engine=Memory;
replace table test (json JSON(SKIP a.b.c)) engine=Memory;
replace table test (json JSON(SKIP aaaa.b.cccc)) engine=Memory;
replace table test (json JSON(SKIP `some path`.`path some`)) engine=Memory;
replace table test (json JSON(SKIP REGEXP '.*a.*')) engine=Memory;
replace table test (json JSON(max_dynamic_paths=10, max_dynamic_types=10, a.b.c UInt32, b.c.d String, SKIP g.d.a, SKIP o.g.a, SKIP REGEXP '.*a.*', SKIP REGEXP 'abc')) engine=Memory;
drop table test;
