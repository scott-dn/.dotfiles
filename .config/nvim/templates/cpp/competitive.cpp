/**
 *    author: {{AUTHOR}}
 *    created: {{DATETIME}}
 **/
#include <bits/stdc++.h>

using namespace std;

// clang-format off
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                         DEBUG
///////////////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef LOCAL
template<typename A,typename B>string to_string(pair<A,B>p);
template<typename A,typename B,typename C>string to_string(tuple<A,B,C>p);
template<typename A,typename B,typename C,typename D>string to_string(tuple<A,B,C,D>p);
string to_string(const string&s){return'"'+s+'"';}
string to_string(const char*s){return to_string((string)s);}
string to_string(const char s){return string(1,s);}
string to_string(bool b){return(b?"true":"false");}
string to_string(vector<bool>v){bool f=true;string r="{";for(int i=0;i<static_cast<int>(v.size());i++){if(!f)r+=", ";f=false;r+=to_string(v[i]);}r+="}";return r;}
template<size_t N>string to_string(bitset<N>v){string r="";for(size_t i=0;i<N;i++)r+=static_cast<char>('0'+v[i]);return r;}
template<typename A>string to_string(A v){bool f=true;string r="{";for(const auto&x:v){if(!f)r+=", ";f=false;r+=to_string(x);}r+="}";return r;}
template<typename A,typename B>string to_string(pair<A,B>p){return"("+to_string(p.f)+", "+to_string(p.second)+")";}
template<typename A,typename B,typename C>string to_string(tuple<A,B,C>p){return"("+to_string(get<0>(p))+", "+to_string(get<1>(p))+", "+to_string(get<2>(p))+")";}
template<typename A,typename B,typename C,typename D>string to_string(tuple<A,B,C,D>p){return"("+to_string(get<0>(p))+", "+to_string(get<1>(p))+", "+to_string(get<2>(p))+", "+to_string(get<3>(p))+")";}
void debug_out(){cerr<<endl;}
template<typename Head,typename...Tail>void debug_out(Head H,Tail...T){cerr<<" "<<to_string(H);debug_out(T...);}
#define debug(...)cerr<<"["<<#__VA_ARGS__<<"]:",debug_out(__VA_ARGS__)
#else
#define debug(...)
#endif

///////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                         MACRO
///////////////////////////////////////////////////////////////////////////////////////////////////////////
#define fi first
#define se second

#define MOD 1000000007
#define MAX 1e9
#define MIN -1e9
#define PI 3.1415926535897932384626433832795
#define EPS 1e-9

#define FAST_IO                                                                                              \
  ios_base::sync_with_stdio(false);                                                                          \
  cin.tie(nullptr);                                                                                          \
  cout.tie(nullptr);

///////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                         TYPE DEFINE
///////////////////////////////////////////////////////////////////////////////////////////////////////////
typedef pair<int, int> PII;
typedef vector<int> VI;
typedef vector<string> VS;
typedef vector<PII> VII;
typedef vector<VI> VVI;
typedef map<int,int> MPII;
typedef set<int> SETI;
typedef multiset<int> MSETI;

typedef long long ll;
typedef unsigned long long ull;
typedef long double ld;

///////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                         BITWISE
///////////////////////////////////////////////////////////////////////////////////////////////////////////
template<typename T>T pow_two(T n){return (T)1<<n;}
template<typename T>T check_bit(T n,T k){return(n>>k)&(T)1;}
template<typename T>void set_bit(T&n,T k){n|=pow_two(k);}
template<typename T>void unset_bit(T&n,T k){n&=~pow_two(k);}
template<typename T>void toggle_bit(T&n,T k){n^=pow_two(k);}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                         MODULO
///////////////////////////////////////////////////////////////////////////////////////////////////////////
template<typename T>T gcd(T a,T b){ll t;while(a){t=a;a=b%a;b=t;}return b;}
template<typename T>T lcm(T a,T b){return(a*(b/gcd(a,b)));}
int add(int a,int b,int c=MOD){int r=a+b;return(r>=c?r-c:r);}
int mod_neg(int a,int b,int c=MOD){int r;if(abs(a-b)<c)r=a-b;else r=(a-b)%c;return(r<0?r+c:r);}
int mul(int a,int b,int c=MOD){ll r=(ll)a*b;return(r>=c?r%c:r);}
ll mulmod(ll a,ll b,ll m=MOD){ll q=(ll)(((ld)a*(ld)b)/(ld)m);ll r=a*b-q*m;if(r>m)r%=m;if(r<0)r+=m;return r;}
template<typename T>T expo(T e,T n){T x=1,p=e;while(n){if(n&1)x=x*p;p=p*p;n>>=1;}return x;}
template<typename T>T power(T e,T n,T m=MOD){T x=1,p=e;while(n){if(n&1)x=mul(x,p,m);p=mul(p,p,m);n>>=1;}return x;}
template<typename T>T extended_euclid(T a,T b,T&x,T&y){T xx=0,yy=1;y=0;x=1;while(b){T q=a/b,t=b;b=a%b;a=t;t=xx;xx=x-q*xx;x=t;t=yy;yy=y-q*yy;y=t;}return a;}
template<typename T>T mod_inverse(T a,T n=MOD){T x,y,z=0;T d=extended_euclid(a,n,x,y);return(d>1?-1:mod_neg(x,z,n));}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                         PRIMES
///////////////////////////////////////////////////////////////////////////////////////////////////////////
template<typename T>inline vector<T>sieve(T n){vector<bool>isprime(n+1,true);isprime[0]=isprime[1]=false;for(int i=2;i*i<=n;i++)if(isprime[i])for(int j=i*i;j<=n;j+=i)isprime[j]=false;vector<T>primes;for(int i=2;i<=n;++i)if(isprime[i])primes.push_back(i);return primes;}
// clang-format on

int main() {
#ifdef LOCAL
  freopen("input.txt", "r", stdin);
  // freopen("MODIFY YOUR OUTPUT PATH HERE", "w", stdout);
  auto start_time = clock();
#endif
  FAST_IO;

  {{MOUSEHERE}}

// clang-format off
#ifdef LOCAL
  auto end_time = clock();
  cerr << "\nExecution time: " << (end_time - start_time) * (int)1e3 / CLOCKS_PER_SEC << " ms\n";
#endif
}
// clang-format on
