
import Cocoa

var combos = [[Int]]()
let target = 38
let highestBlock = 19

func appendIfNew(potential: [Int]) -> Bool
{
    for combo in combos
    {
        if combo == potential
        {
            return false
        }
    }
    combos.append(potential)
    print(potential)
    return true
}

for var a = 1; a < highestBlock + 1; a++
{
    var candidates = [0,0,0,0,0]
    candidates[0] = a
    for var b = 2; b < highestBlock + 1; b++
    {
        if candidates.contains(b) { continue }
        candidates[1] = b
        var c = target - (a + b)
        if c <= highestBlock && c > 0 && !candidates.contains(c)
        {
            appendIfNew([a,b,c].sort({$0 < $1}))
        }
        for c = 3; c < highestBlock + 1; c++
        {
            if candidates.contains(c) { continue }
            candidates[2] = c
            var d = target - (a + b + c)
            if d <= highestBlock && d > 0 && !candidates.contains(d)
            {
                appendIfNew([a,b,c,d].sort({$0 < $1}))
            }
            for d = 4; d < highestBlock + 1; d++
            {
                if candidates.contains(d) { continue }
                candidates[3] = d
                var e = target - (a + b + c + d)
                if e <= highestBlock && e > 0 && !candidates.contains(e)
                {
                    appendIfNew([a,b,c,d,e].sort({$0 < $1}))
                }
                
                /* // Continue on if you want combos with more numbers. I used it for 6's before
                for e = 6; e < 20; e++
                {
                    if e == d || e == c || e == b || e == a { continue }
                    var f = 71 - (a + b + c + d + e)
                    if f > 0 && f <= 19 && f != e && f != d && f != c && f != b && f != a
                    {
                        appendIfNew([a,b,c,d,e,f].sort({$0 < $1}))
                    }
                }
                */
            }
        }
    }
}



