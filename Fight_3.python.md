#  Fight #3 in Python
// used as an example
//https://www.cyberforum.ru/python-tasks/thread2943547.html
/*
Мы знаем количество гостей, ваша задача рассадить всех за стол.
Однако, некоторые гости дали вам список неприятелей, с которыми они не сядут. 
Стулья расставили так, что у стола оказалось два крайних места, у которых только один соседний гость. В остальных случаях соседа два.
Определите, можно ли рассадить гостей так, чтобы все оказались довольны.
Ввод:
invited_list - количество приглашённых гостей, 0<invited_list<10
dislike_list - строчный массив неприятелей, ["1-2,3"] - означает, что гость под номером 1 не сядет с гостями 2 и 3
Вывод:
Boolean - возможно ли рассадить гостей так, чтобы они все были довольны

Пример:
invited_list = 4
dislike_list = ["1-2", "3-4"]
get_result(invited_list, dislike_list) = True // [1, 4, 2, 3]
*/

/*
def guests_seating( n, dis ):
    lis = list( range(1, n + 1) )
    bad_pairs = set()
    for e in dis:
        L, de, R = e.partition('-')
        not_frends = set( int(x) for x in R.split(',') )
        for nf in not_frends:
            bad_pairs.add( frozenset( [int(L), nf] ) )
    res = [ [x] for x in lis ]
    flag = True
    while flag:
        flag = False
        for x in res:
            for y in lis:
                if frozenset([x[-1],y]) not in bad_pairs and y not in x:
                    x.append(y)
                    flag = True
                    if len(x) == n:
                        #return x
                        return True
    return False
#==============================================================================
n = 10
dis = '1-2,4,6,8 3-5,7,9 4-1,2,3 5-2,4 6-3'.split()
print( guests_seating( n, dis ) )

*/
